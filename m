Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96338329371;
	Mon, 13 Apr 2026 16:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099503; cv=none; b=n56Ktk4dxCtQdG6p7/cSB9JHzIGrk+rMFGCZkxR+4WOhWq4+aiBgQBHVsj7blf99whpY0PSyNhl8pss1t928j79pS1UjLJVefsIt17mfEcPGetC00M28xHHV+xTnnT7+tq+r66BhgWpq9HZo0RwIDum1gJDSurwFQniQ5bPVTSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099503; c=relaxed/simple;
	bh=6ZAm5jjyPeDoYACVZEUnFvG2IuiUXk5ncltJjjjbZEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgusFNfS84r7ZQKTPaBi+EtyLRj5Q4rsYZJm+c8fadZ3Bo8T0IHC3CkIGP2AVrzPErE7kHhJofOhbn6oW0Xn1JvuBlIIXst09YcnDQxtMK5PuEaCc1jFwds+NUPGIHQ0TYF9aHcJCYW7B5wnn9j7dRuo7/9rRlullMtHNiOCscg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOXSwjak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOXSwjak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1AEC2BCAF;
	Mon, 13 Apr 2026 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099503;
	bh=6ZAm5jjyPeDoYACVZEUnFvG2IuiUXk5ncltJjjjbZEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOXSwjak+cn1PBVpAyI/38iHJI6bb9+tQBYyyMKga8g5G5VdAJR1L50qQ9wRinv62
	 LtvEFUWVeL/+bm832r7/RFCLmVlRwYbMK/M2uLqub5wP3QThRuUKF7Gmqfnx1n3f/n
	 kBVtqx/KAl0Hgbz8KfouQ+Pfhyv7STpXKa2w+NzXS9qCxPcWdlljTFc66u8wletN+I
	 6GD5qsI9wZbq5nTM7ltPYsH79s7P749sJaHvsgiYqC9Hx+SocwAYj2bN1tAntudHQc
	 dwxYLZGU/7yNiq3SLJCRQtBZsnKlXOlNzkubt8hGIT5N06jsEuC1otO6Ve2NDz7tc5
	 nUfS9P9T/T4vw==
Date: Mon, 13 Apr 2026 11:58:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/of: fdt: validate stdout-path properties before
 parsing them
Message-ID: <177609949656.2989431.4492579275535229124.robh@kernel.org>
References: <20260403143001.1-dt-fdt-stdout-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403143001.1-dt-fdt-stdout-pengpeng@iscas.ac.cn>


On Fri, 03 Apr 2026 11:55:29 +0800, Pengpeng Hou wrote:
> early_init_dt_scan_chosen_stdout() fetches stdout-path and
> linux,stdout-path directly from the flat DT and immediately passes the
> result to strchrnul(). Flat DT properties are raw firmware-supplied
> byte sequences, and this path does not prove that either property is
> NUL-terminated within its declared bounds.
> 
> Use fdt_stringlist_get() so malformed unterminated stdout-path
> properties are rejected before the local parser walks them as C
> strings.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/of/fdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

