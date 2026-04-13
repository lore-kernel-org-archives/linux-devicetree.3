Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32B31F9BC;
	Mon, 13 Apr 2026 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776100494; cv=none; b=dfgJ0bELy3GjmIyDhKMFnmgvx9y0ysakoC/TI/lXqLD4B+k0v7MJtBB4bkvvD39ngh1BCITiK+BbfuDh5QpPM9rkFOR9zI6cJYme1HAu+sRrnBDNBGOfSQGHeYGsNIzvzAhqhbJ5m/F7unmgTkX5SCw73pbCJqJBB9b1bIMwzsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776100494; c=relaxed/simple;
	bh=0AIA9UOyFoe08XtxzfvecrnQRBkrbNCd64UtJb+1e0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek/DV9fdy3m53dxUHgpS7aUZGzi/oL8QxzlDUl9HuG+LA1IutX2gdVeuJYSSIpnkN1n+IhYo9V8HD4O+XcS2qUTcAeMQQL1rkWL3l04cVVkPTlilnuMfysuuwkh8j8aRmd6YrZB5yIugSmX8xvl4iyd2iC73FjAqtfzwCZqbFYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufSzTrgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufSzTrgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AFAC2BCAF;
	Mon, 13 Apr 2026 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100494;
	bh=0AIA9UOyFoe08XtxzfvecrnQRBkrbNCd64UtJb+1e0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufSzTrgq5DDYa7AunCgZmF9PCwyF4jI0UopDKzFQAJFLiX/LirymfEQZMMBWzErNP
	 97WcO00xrabs8amHsNj5l4qADQTkStXPSg6dLMKlonZ2RLfQi+l/By/etEZkUxhm3G
	 WrqYlWuwGZHgsUP3ULQJfau7qyBs+scKWi+/RNjnB8Y8MZN2iEellRWUMJmspDwDOH
	 NF9r+fI1T/KwXhz5ARBcgdhV0dM8lihR6sSh3s3TpSQYwLB1QdgRsB+uxtpU96JQEf
	 AfmvbAq/D5WoBVb9zakSIo+ZGsD2XO0MTZvDlCQv2O3YKeFnoiE+eenhXWXwXfds54
	 xJkYWBkC57mDA==
Date: Mon, 13 Apr 2026 12:14:51 -0500
From: Rob Herring <robh@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drivers/of: validate live-tree string properties
 before string use
Message-ID: <20260413171451.GA2991745-robh@kernel.org>
References: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>

On Fri, Apr 03, 2026 at 03:32:30PM +0800, Pengpeng Hou wrote:
> `populate_properties()` stores live-tree property values as raw byte
> sequences plus a separate `length`. They are not globally guaranteed to
> be NUL-terminated.
> 
> `of_prop_next_string()` currently advances through string-list
> properties with `strlen()`, `__of_node_is_type()` compares raw
> `device_type` bytes with `strcmp()`, `__of_device_is_status()` compares
> raw `status` bytes with `strcmp()`/`strncmp()`, and
> `of_alias_from_compatible()` treats the first `compatible` entry as a
> NUL-terminated string.
> 
> Validate these strings within their property bounds before treating
> them as C strings. In particular, reject malformed string-list entries
> whose next string is not terminated before `of_prop_next_string()`
> returns it.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> 
> ---
> drivers/of/base.c     | 39 +++++++++++++++++++++++----------------
> drivers/of/property.c | 30 +++++++++++++++++++++++++-----
>  2 files changed, 48 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 57420806c1a2..3c6af4051ad3 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -82,7 +82,14 @@ EXPORT_SYMBOL(of_node_name_prefix);
>  
>  static bool __of_node_is_type(const struct device_node *np, const char *type)
>  {
> -	const char *match = __of_get_property(np, "device_type", NULL);
> +	const char *match;
> +	int matchlen;
> +
> +	match = __of_get_property(np, "device_type", &matchlen);
> +	if (!match || matchlen <= 0)
> +		return false;
> +	if (strnlen(match, matchlen) >= matchlen)
> +		return false;

Can't we use of_property_match_string() instead?

>  
>  	return np && match && type && !strcmp(match, type);
>  }
> @@ -491,22 +498,22 @@ static bool __of_device_is_status(const struct device_node *device,
>  		return false;
>  
>  	status = __of_get_property(device, "status", &statlen);
> -	if (status == NULL)
> +	if (!status || statlen <= 0)
> +		return false;
> +	if (strnlen(status, statlen) >= statlen)
>  		return false;
>  
> -	if (statlen > 0) {
> -		while (*strings) {
> -			unsigned int len = strlen(*strings);
> +	while (*strings) {
> +		unsigned int len = strlen(*strings);
>  
> -			if ((*strings)[len - 1] == '-') {
> -				if (!strncmp(status, *strings, len))
> -					return true;
> -			} else {
> -				if (!strcmp(status, *strings))
> -					return true;
> -			}
> -			strings++;
> +		if ((*strings)[len - 1] == '-') {
> +			if (!strncmp(status, *strings, len))
> +				return true;
> +		} else {
> +			if (!strcmp(status, *strings))
> +				return true;
>  		}
> +		strings++;
>  	}
>  
>  	return false;
> @@ -1217,10 +1224,10 @@ EXPORT_SYMBOL(of_find_matching_node_and_match);
>  int of_alias_from_compatible(const struct device_node *node, char *alias, int len)
>  {
>  	const char *compatible, *p;
> -	int cplen;
> +	int ret;
>  
> -	compatible = of_get_property(node, "compatible", &cplen);
> -	if (!compatible || strlen(compatible) > cplen)
> +	ret = of_property_read_string_index(node, "compatible", 0, &compatible);
> +	if (ret)
>  		return -ENODEV;
>  	p = strchr(compatible, ',');
>  	strscpy(alias, p ? p + 1 : compatible, len);
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 50d95d512bf5..edbc7a95aa4c 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -648,16 +648,36 @@ EXPORT_SYMBOL_GPL(of_prop_next_u32);
>  
>  const char *of_prop_next_string(const struct property *prop, const char *cur)
>  {
> -	const void *curv = cur;
> +	const char *curv = cur;
> +	const char *end;
> +	size_t len;
>  
> -	if (!prop)
> +	if (!prop || !prop->value || !prop->length)
>  		return NULL;
>  
> -	if (!cur)
> +	end = prop->value + prop->length;
> +
> +	if (!cur) {
> +		len = strnlen(prop->value, prop->length);
> +		if (len >= prop->length)
> +			return NULL;
> +
>  		return prop->value;

You return here, but cur is still NULL. So we never advance. We should 
have a test case in the unit test for this. If not, please add one.

> +	}
>  
> -	curv += strlen(cur) + 1;
> -	if (curv >= prop->value + prop->length)
> +	if (cur < (const char *)prop->value || cur >= end)
> +		return NULL;
> +
> +	len = strnlen(cur, end - cur);
> +	if (len >= end - cur)
> +		return NULL;
> +
> +	curv += len + 1;
> +	if (curv >= end)
> +		return NULL;
> +
> +	len = strnlen(curv, end - curv);

Can we make this so we're not doing strnlen() on each string twice. If 
return the current string, then 'cur' can point to the next string.


> +	if (len >= end - curv)
>  		return NULL;
>  
>  	return curv;
> -- 
> 2.50.1 (Apple Git-155)
> 
> 
