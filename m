Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004898;
	b=JHcXpYdrxUNP3kNbb+8+cULYHuxo02g4RAmeicbRjow6dfpfDwV6soD0PQuQunIbpR2g
	 k2mxfi04YmYjAX4uCIfapkglfGINchve9kQw/wy9158n6q5lEvPmRiu9YnE4QDIz70D4P
	 WXGBP3mSTEomZZSGgLi11+fcbjYYsM6WjtXT8s1+IZYyYA59XZxFmT5Gr9KFak4fGkKYf
	 fsy5uzqszquSDDDDXA2gCFT2qOsM80tHW1ro5gk0r4DWz4wqsn/zKBLcNVk/EuaQIJdD9
	 nlKmCMNIZBCGp3ANCHNS/BfknoirYiEN6xvxDCsDMYlUFJ/oOEcVzPwY6cgdutqWF3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
	b=pJr+SMZcgVZJCJ/BlumqakkMCcOmQo07/hMLf77gmWlynBMmFPN3moJhbfE2/iMMYS19
	 41V7v6vAqnG1bhv6PHw0zheEozPcf3ea2KqGhBTHR5A9dciYEOS+g4cRzfePapGmXyLn5
	 qHuIpSEn251ck1FSNH6vi7qrkE7r5rTyKx5aMRdn7P1yhth91xnZ1Yn0ae54D5cd6L7l0
	 0gJl5OIxBTtrlXxd+XOcHjCbMeYj+eXebtBoqUOdYgE9MDBNrjOF5gExwYty8mPd/JshT
	 mHCL0qSnERUPzGO/z4Q7q/BBVc2AGrRfbq/+6uQh6iJ3hGpx3OuH/nLH7pe2vcgyVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TBQhTOrn;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91BA606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91BA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TBQhTOrn
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8599105e9.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004896; x=1795609696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
        b=TBQhTOrnnS0ar/e0kk7km69A8QdgRM+sYN7qDTa0ZC5LwiqXxtyy/jR9q8qCj6x12U
         mNaSJjFs/wsR82rqLlJIGvY8H3rdzhQZ8MKMkZIA7Ok/I3dhaghnrR0DFSyt+uZlXVat
         IehcWYpNQVgZWnqthxrfFpi1FBOK5xprYHlSjY1TITswsejUpfATvckE7OrSgEfwM4HQ
         QeWq1/5L9fZY6AZ6LbhNmXgcKruMeI1PqT2H3OaSIydGpE3uEqCSHIH2wsONkGAGvAfl
         6bxEeF3P2bSuIgIipSKOcVbUEmJmX166ehnezVcgVHukyOQpp5QvzxoSR/ktTGZTiHZj
         uDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004896; x=1795609696;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
        b=eMCZCG6s6n9NsVZ7/gr/SZuIi4yRQKewWo0iv48W9ybC3YKsA8Ap9EkbZAK0u89Ogf
         07uM+EaCsxg/WFBdkpv9aESYM1Onqmhi4ge9tiHkH+DgmhQP6mHVY3ntFoOH12EaaC3T
         K5NYbYw9f9RL2//LZKT/x0TFkcoADNRgQz9lKYgJ3twBgDmWtDKCB/pwjozN6XfPkZ9a
         vMKjsJNUTBtcad7BlhmZMcfUwELDl7dU07S0syLRhm6HSk5JIQ2EzBOGdBGS15TQCvA7
         JIJvbXhVhdg36/gTZnC+UVQXw9/zqrPVTj2athaW13mCQGRpD01ZCoUnaiBMpg2cyIlY
         WU/g==
X-Forwarded-Encrypted: i=1; AL+hErHLhGAAW32kAzFXQEi/qeOP4qrQ/96lZYQ2BurF+AAR5P5Gpqzl1X8yMhIoM1ZnYCUFSIiE2l8B/CSr@vger.kernel.org
X-Gm-Message-State: APuU4Z/MCW5pg7MkEzOLIuqy+kRxd1E741dqPb5jZYBm5Fe83ON3rA1W
	VN59yad5OigcOBCCUhVHjSQj9QMyq1kVBEdrwEDR+mio6xaBUI5U30PsgtEGYDyRFSI=
X-Gm-Gg: AYBFou0i9xx1NVio0XWZwAkrWxzH/nAQHKxOWd4Zj9Bt8H0UYYNm1dCJkm2K3AtIehi
	VfK5g3XNWVXoQY6WZRB6B+rfeLJ+fxO8Bpd9sD4PCOODzRbG0dOBjRBcb5xzOiOXh+rIyTJX2RR
	bHvbZ9umWO9ix2+QeEnM5UES7cDYwcQpuWdUqEv17MipFRZ0VRqpmY99LDp6FYFyOZbDEEgKr0v
	lqUmLM/6N23GvLzKuh7sL59yXR4etTPBrRmpsVNvL2ct8Crewg6W2YRfEWZp1Ox7VfAbJGSRR0W
	hQz/s7gg+nA1vWKql6KrXgi/8ZPqBLu0Id/GWW4QveqMqpKmn4xUJbPMG/fhwMNePeLtVfBL+NR
	YAGUzDBVKYU/hGse3Rlk5pESQ1+ch4s396ZIldr8OujvpKxLVDW457+umwqnmoRSQZGjmEbeJHJ
	vrn/KdcT+WxLCQJU+EiYMYSoOB1XFAqCJcWYjKsyRfWoo2srVxmj9xlNwInmaaffz87bzFlwTt8
	WlGhIeLmH25CNVX0eLdcK8oBEIPkHbHCrx6mEg73DR1A2k91bND0OzL5w7fw0eWDYGQEiwKhfV/
	bw79ZnssKnoavxAvchTMAKujH5S3G+ifhyZstIeWg0tS6I1NojcmptXW275Ih9LPzFoBgnnooZF
	dqA==
X-Received: by 2002:a05:600c:8b63:b0:4bb:6871:8f21 with SMTP id 5b1f17b1804b1-4bb7da27fd2mr44906275e9.23.1795004896063;
        Wed, 18 Nov 2026 04:28:16 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm64858355e9.7.2026.11.18.04.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:15 -0800 (PST)
Message-ID: <6291be5c-94e8-4a5b-aa30-f797672e4165@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 10/12] accel/rocket: add a GET_PARAM ioctl for the
 hardware version
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <bd963b70e40af3c3c74ac1569cda7be885b0ada1.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <bd963b70e40af3c3c74ac1569cda7be885b0ada1.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> Add DRM_IOCTL_ROCKET_GET_PARAM so that userspace can query the NPU
> hardware version and pick the matching hardware description, such as the
> SRAM configuration and the register layout.
> 
> Add DRM_ROCKET_PARAM_HW_VERSION, which returns a hardware version enum
> that matches the device tree compatible.
> 
> The enum starts at 1 and 0 is not used:
> 
>   RK3588: 1
>   RK3576: 2

I wonder if REG_PC_VERSION / REG_PC_VERSION_NUM could be used instead of
creating our own numbering scheme?

> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
> index ef7043046bc6..50c8b05bd394 100644
> --- a/drivers/accel/rocket/rocket_core.h
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -41,6 +41,7 @@ struct rocket_soc_data {
>  	unsigned int num_clks;
>  	unsigned int num_resets;
>  	bool task_con_16bit;
> +	u32 hw_version;
>  };


If we're adding hw_version here then perhaps the task_con register
selection could be made based on the hw_version field value. Then we
don't need an extra flag.

> +static int
> +rocket_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct drm_rocket_get_param *args = data;
> +	const struct rocket_soc_data *soc;
> +
> +	if (args->reserved != 0) {
> +		drm_dbg(dev, "Reserved field in drm_rocket_get_param struct should be 0.\n");
> +		return -EINVAL;
> +	}
> +
> +	soc = READ_ONCE(rdev->cores[0].soc);

Does it make sense to do READ_ONCE if the variable was not written with
WRITE_ONCE?

If my quick read of commits like 89c2c777df17 is correct, it's possible
that there are gaps anywhere in the cores[] list; please double check if
it's safe to always assume core 0 exists.

> +/**
> + * enum drm_rocket_param - parameters for DRM_IOCTL_ROCKET_GET_PARAM
> + * @DRM_ROCKET_PARAM_HW_VERSION: an enum drm_rocket_hw_version value.
> + */
> +enum drm_rocket_param {
> +	DRM_ROCKET_PARAM_HW_VERSION = 0,
> +};
> +
> +/**
> + * enum drm_rocket_hw_version - the NPU, one value per DT compatible
> + * @DRM_ROCKET_HW_RK3588: "rockchip,rk3588-rknn-core"
> + * @DRM_ROCKET_HW_RK3576: "rockchip,rk3576-rknn-core"
> + */

Let's not document these as a match against compatible and their values,
just state it as a way of identifying the NPU chipset.
