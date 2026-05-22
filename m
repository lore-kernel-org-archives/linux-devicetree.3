Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D7036A02E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479730; cv=none; b=FcqnttnMjI8fg2xQ1RAFFLPVJlPy0g9KmtpdET4ZC19x45ZybG32Tpt+F6M4/FyPnQ5G7NP4Fvo8LOvDf3IjFCcCl2ZmNHmAoJyD4HalRiPdY3y9yUsnDErWFolflBNjcEPWVLNhr+mYehAUJsR4j09iWBTWIPig678jCKYg+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479730; c=relaxed/simple;
	bh=3Fs/ml5UcL3DeI8Udn3BJweQNyfu+QmtJOL6ZN0uPQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq2VqodXZKLfuh4ewi3kMLCFnBelG57pLMQGLPKgbnotVMLNWDwR+x/IirA2AaUqtZC4Of6GmXdcywYtGDjn+8drYw0XTntHrYi5/eSdbNVJHbCagG4Gg607e5hmO8RO7ptZFKzSjHUpRSaKH2UptYmJRBoCAVV2Y0wlXuAGiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1zsXI/d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1zsXI/d"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so22459345e9.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779479727; x=1780084527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vC76+wE+m69DnNHzueD5T2LV/NT7LEvFIu8/P6enzg=;
        b=q1zsXI/dHdFijni7US63jVxsw4/MHYPVgzMF5IR3iOUB5nef5hQqBRYUNxCi8983S3
         3YzYotrgTZulO7w+s4dDqJpCggldRMBeWGhegrgIibkbjbSZsgSixCqhDu44Hmh8MBna
         PuYDjgU9SETD+tfUqxrShh40lIf2GkL/6ZNx8Tgs4km+4+oVHwZFWsXOW2aUnnQsq0cv
         3OkQtPRjT3hTdvlb17uDv3Me9mDy6C3aW4QhrpReRqk6eBnyh+WKzVIo/tyr/LOQsZkh
         nXrMb+3MK0uyWO5DDtBPXgZRKvm1DeYSi/gUO8SV4OqPWIa9Vy971kKUaU2XoCnd0j7n
         fQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479727; x=1780084527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vC76+wE+m69DnNHzueD5T2LV/NT7LEvFIu8/P6enzg=;
        b=AZLqTyt8SencomQgTsnZdU+AmsLDvvXIVJtctNOMgUkcpp01IBRFKlhjCBm6MF9u1Z
         BW46d9Wpw1NBoXxwNYK2Z2VcBqI39FyARIyezlafcJtMjvQOtJ2Gm0nZqztyHz7jfnB0
         Go+vXsg6UBeQHuBLQR3dVUGraU0fyXpsW9XlHQijHcxr8+YtEKzXMl3ZoGkyv6IzrMUl
         VuiubIqhIwE5+iZbaT/ZtipdJ8xrU4HuaMGhIfTPkxeDaMrZTje/wqVL/+bKDL9RVEc+
         m+eQAa27Bgjf54L08obvpo8XCwBlW4zUhVIWHt4fySHAS+3JtA45xc9sPNOOagjtCule
         pbRA==
X-Forwarded-Encrypted: i=1; AFNElJ8/7FUI4OBOmHC2blRY0T6ZA+Et2T1PFSOy3rB+lZtt5g9KJssjyCfPN1pgbo5ks9I9XaJ+GS0tTNSA@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1Hp2EmQGPK3n0R7f1iydlywhAgJ5v+dQzBQIECQ1lXMezEXC
	kPdUa+1KVmQSt5Q+pWblCj8wxKE8VeGrhbI9apIB0hyTe6oXe/XzUCyV
X-Gm-Gg: Acq92OGhAOq33vjF7h1dKG5p1OZk+gjCEBK6qfCtEL3Jhxi0BK097KjTj+VUYVWgSTQ
	twgWd2affCBnTDouPNIM0OV5iGkwLxP0hO16JxOk2Fv99ppRovL4z4Tyw1ZXVHGnoyuRuk2sZNz
	IwA0eYGKp9qOV5t4G0gdqtRCMofyCEVnzUtCsbBG8Xk0Z2ypJQ8jqx1RCwB7pO73bps2B5B9LPq
	69yhhM7Fx0xJl2lKIUar8XXEvGjzZJGsEO/gUh4eu1aj6NMRFd4QVgkOoiV+i97IqqO8anYLsx6
	TW6Ds7mOmR6u42G2Ngdg/m21DYQWXr4hoEAVYXhIcOJWO6q0rORpeo9rbtUGP1CiPvhqtW1tXvi
	ZperQ2Hy2zcqo4SKDMRE+Ryxa2if0fH6ydG5QOQZgTnZGzdq5bpw3eXtMDxL1s+6z6RfS2RgKjB
	d7px17zVZ1RoOdwXWWqOrqfyDXaTc=
X-Received: by 2002:a05:600c:8b41:b0:490:4a1b:d8d4 with SMTP id 5b1f17b1804b1-4904a1bd912mr27811225e9.27.1779479726825;
        Fri, 22 May 2026 12:55:26 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d44f6sm32907425e9.8.2026.05.22.12.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:26 -0700 (PDT)
Date: Fri, 22 May 2026 22:55:19 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/12] rvtrace: Add functions to create/destroy a
 trace component path
Message-ID: <ahC0p0QTCQiFG-SX@curiosity>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-4-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-4-anup.patel@oss.qualcomm.com>

> Trace needs to be configured on a chain of trace components which are
> connected to each other. These chain of components is also referred
> to as trace component path. Add functions to create/destroy a trace
> component path which will be later used by RISC-V trace perf support.
> 
> Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/rvtrace-core.c | 223 +++++++++++++++++++++++
>  include/linux/rvtrace.h                  |  43 ++++-
>  2 files changed, 264 insertions(+), 2 deletions(-)

...


I have been playing with a bit more complicated rvtrace graph with one
source (encoder) and two sinks (ramsink and simple test atb bridge sink)
with the following encoder output ports:

:    trace@c000000 {
:      compatible = "qemu,trace-component", "riscv,trace-component";
:      reg = <0xc000000 0x1000>;
:      cpus = <&CPU0>;
:
:      out-ports {
:        port@0 {
:          reg = <0>;
:          CPU0_ENCODER_RAMSINK_OUTPUT: endpoint {
:            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
:          };
:        };
:        port@1 {
:          reg = <1>;
:          CPU0_ENCODER_TEST_OUTPUT: endpoint {
:            remote-endpoint = <&CPU0_TEST_INPUT>;
:          };
:        };
:      };
:    };

In this case the first output port is enabled, but the second one is
not.

> +static int build_path_walk_fn(struct rvtrace_component *comp, bool *stop,
> +			      struct rvtrace_connection *stop_conn,
> +			      void *priv)
> +{
> +	struct build_path_walk_priv *ppriv = priv;
> +	struct rvtrace_path *path = ppriv->path;
> +	struct rvtrace_path_node *node;
> +
> +	if ((!ppriv->sink && rvtrace_is_sink(comp->pdata)) ||
> +	    (ppriv->sink && ppriv->sink == comp))
> +		*stop = true;
> +

IIUC the root cause is that rvtrace_create_path from rvtrace-perf.c,
where the second argument is NULL, selects the first reachable sink.
The function __rvtrace_walk_output_components() walks pdata->outconns[]
in order and stops at the first component where rvtrace_is_sink() is true.
In the example with two sinks we stop at ramsink. As a result, the second
sink is not added to the list and never enabled later on.

> +	if (*stop) {
> +		node = kzalloc_obj(*node);
> +		if (!path)
> +			return -ENOMEM;
> +		INIT_LIST_HEAD(&node->head);
> +		rvtrace_get_component(comp);
> +		node->comp = comp;
> +		node->conn = stop_conn;
> +		list_add(&node->head, &path->comp_list);
> +	}
> +
> +	return 0;
> +}

Regards,
Sergey
