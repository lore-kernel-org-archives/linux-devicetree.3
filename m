Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8F366820
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640902; cv=pass; b=MaWaQ+pnEW1ITKTwNpPSsLXOX7FldJ7bqfQ4XfzYcU+AgPpyhrpmZFSGnm6UOo6MRfSyviPseNi8lH9KIRbtRv0sYN1YlDZ1Xdcl+8LptdkLkKRPx43T1jJR/0w1B+rRRUZzQUyjfLP13dj4574tM7detOVOvzqJmv/h4I9hGG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640902; c=relaxed/simple;
	bh=FC1jKvk7IR/JY6cYWwDQaxgJwqGXQyShLSdz4569yZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxdFPjaylj9p9ZcFgQtu4deLxW+JwBMXa2U77Yxf/JgDX2EjCnU8ULiJsXj/Kyqjp2d3DwG0vqKf6eIJFZBgsGsq3kolST84VSj5dfP3mbsIo3cKkGRKw6SXVdX7ajHUVQatG8tnb6exNSlAh81kb3vT0sBKCc9mmDAtgHAQ/bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWhxBlQH; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWhxBlQH"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81e6f0b4610so116982847b3.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784640900; cv=none;
        d=google.com; s=arc-20260327;
        b=HYXiEgDIhJA59sN3dzTgmli5gBWUL+bUSBwIiWsP55VD61TAW6+vzEmejNRG7702nJ
         nYpsPZpFQ4jjm2JQUhuK4d29zABzDNQQfWGqahgUzrYwwBfNPjwt94EYWEuN7ZK8V8QY
         ecQhV5VzQAhzvOyC4ACeQrqmMVZGsGHDr/GNYxH5fDth04AhiY4xMAXY5IQnUozl1fyG
         j+GQ8WMFospJAHfiGMX0B5P8UkGxCM/j4L8uuuKLe29Je+CTxXNfMUcTxwjdpe+WP9v2
         p4gzyZpUtuPJYk9w6IsVrrg7MtKHYVEKrq0cGABQmvwAI9D4wQDB/2046ADQG3833Etn
         5lhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i86R+52aISfP5t62myBuNbHCUamsT0SSyOwnWKb4yLo=;
        fh=DMmHBLGsXz22+TKBIgTSFt3EBCGkVsbJ9S+ItOW5v4A=;
        b=EU+5verx4WPF3aSCWfZwkeW8CjdYmsZqEmLmW6IRPqnJNgz5Hdy1oN87UGTgYbDP9/
         5+2O6pRtwqFNZVM0gGD65vnzORqTaMqafN0ebRWy/8ZX39k5ORk69274/+ReYZsStQtO
         X1Tfeom49AplquGdS+97rPYgzxYEIjKaaPSCHk0xe98mX7vBZPEg6uO8faGuvbWOJnrp
         0lEmJn+OcfuzgjlWkftcrpwumIP10jt8yWRDfChHOe0weeTNIEbECV14C/W9YXONdvMM
         iwP2WegjTsuV/49B7QFV/NRl9EAQZl8FGYkeTZ338NWlGlUb3q0tRC38gWsik1JqfXt6
         +2TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640900; x=1785245700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i86R+52aISfP5t62myBuNbHCUamsT0SSyOwnWKb4yLo=;
        b=UWhxBlQHyLZ5QMINQ6OACiZxcJBNKpA4m99JJWSGWtqhiy4fZXQRpbPMQ5Bu+OF6f+
         HsRQjNk2gRAX6tc2tGOw3pILdJgw38D3DBTe2EF1Tv/Ve+8DUOuX5KE8rt7tiDgEWV4q
         J2hJHRDH5Xjm7MNSjASJeKxSRpeE+HhpUnxn0vH+yjQlJHycSuj/kAHZGO0bXXWzDiC3
         6twzs354a2dXrh5bgXEFbhyL/Js3hmIr/gUb1WcMpDYkOdOlxGhX5kK90+f/GQI4sbRv
         Gs8wn+QEtGieRWIf/DHx477tA30Dvm5mbMwzNElrtXZ10FSXg3eOFl9KrpUcahK0RCkK
         y+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640900; x=1785245700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i86R+52aISfP5t62myBuNbHCUamsT0SSyOwnWKb4yLo=;
        b=Vv6v9aR7Uf4uAmdagnlIH4cAo5EvwJNtl02yhdPLtNkbYeuL6U83cEUJsjQnKLcgK/
         G27vfv2DjnNMcD+afBqDUldbJBbeHFKfvYx5xA+79h/rRfQTqIpD22wZOhMNKmLz0nzd
         8NnI4JrnA3OdCgXTBymztgR/LrN8z0ADOh1+QB735DQ97ztIR7KPM4vxkVKQZdre3sSM
         abZKU+xg3KnntgmvOgdJZjeJN4B0O/tXD1tKdE+/f8Swc/YvhpIWsWYh4IkGKjVT9JCb
         OZKy9Eto6HvtZi0vit7rXcZ6+nYifcyMjmKYN8s1imjskngdrNOjMLxMmdd5eJUiHeQL
         6NHw==
X-Gm-Message-State: AOJu0YyfudCpmnDhnk4LsuFG1x1Rly8BKiEYIMZ8uGq68H8qrxXvPIR2
	TPB+W4XUjgt1TL2vhEmTNVihlbo1aclJ1sE5pYGWUI9MNh2HdiXVlVN/bgH+nUvuLfb8iqH82oH
	pVtebar1yEqqyFO7POEIsDmNQRDN09G0=
X-Gm-Gg: AR+sD12oojG4qYsxBcITRzNSnazibMXQAtDTkwNeW5BUEOXchIfmDRvfsLo8OYpyyAk
	uArOpeu3/EPOHlYrT+NNU7hIBHD1nbhfKmVppviZjhowl8+D7MiiRhJwDh1dv+hV/3js/pTINto
	iAYlPjw3PXkFOsmCBghcxG2dK6/+d2Kmdu67S11hRm2tQDYR2YXh1pQulaXe+fCOiPeJzGM8bi5
	czr8GkZjBIgpQWd+96roOIQFMdG5sT7QxuAlip+ShCQZUI8g4vZqsV6jEJCekDvZx8Q
X-Received: by 2002:a05:690c:c4e7:b0:81d:9452:715c with SMTP id
 00721157ae682-81ef25c801amr58767777b3.20.1784640899815; Tue, 21 Jul 2026
 06:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721082410.18275-1-kaipeng94@gmail.com> <20260721082410.18275-3-kaipeng94@gmail.com>
 <f15fb988-09a7-48c8-aaa5-2a5dec3a1d15@oss.qualcomm.com>
In-Reply-To: <f15fb988-09a7-48c8-aaa5-2a5dec3a1d15@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Tue, 21 Jul 2026 21:34:48 +0800
X-Gm-Features: AUfX_mxLpLfwnkLuIp48lcTkxxMoKVznBIByIHH4kKSg8CZ_wjSB1qFA--HN7dU
Message-ID: <CAHk8Zds-rCfWZLfjM54vNPDK8qF6t8u5qSyMjeGU0mc7V2EKOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:18=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/21/26 10:24 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> > It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> > This device tree implementation references nodes from the x1-crd.dtsi.
>
> [...]
>
>
> > +&usb_1_ss1_qmpphy {
> > +     vdda-phy-supply =3D <&vreg_l2j_1p2>;
> > +     vdda-pll-supply =3D <&vreg_l2d_0p9>;
> > +
> > +     status =3D "okay";
> > +
> > +     /delete-property/ mode-switch;
> > +     /delete-property/ orientation-switch;
> > +
> > +     ports {
> > +             /delete-node/ port@2;
> > +     };
>
> What happened here?
>

SFA14-11 only has a single USB Type-C which uses usb_1_ss0_qmpphy.
Sashiko reminded me to delete mode-switch and orientation-switch in
usb_1_ss1_qmpphy (And I remove these properties in usb_1_ss2_qmpphy also).
Since the usb_1_ss1_qmpphy_dp_in (port@2) remote-endpoint is mdss_dp1_out,
and mdss_dp1 is not used (DP Alt Mode), I remove port@2 in usb_1_ss1_qmpphy
and port@1 in mdss_dp1_out.

> Konrad

Thanks for your review!
