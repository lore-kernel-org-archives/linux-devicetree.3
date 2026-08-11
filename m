Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909922FD1CA
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 04:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786423199; cv=pass; b=iJi3WBnzAA12rDpGUwhwOXP2g5kOJ9153tssfIvLvbIQUOOXIBv27MNBt+8pTxIsYN4kWsHhj3RdXQOEhq+xuDEn1zpdz1jYRBkgtcST5OOgbCbTGvm3SbnirfQsjuRwWxL2+GWqj9vwXUM0kaKUqkjB3Zv2jdNozzpAu2Krmc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786423199; c=relaxed/simple;
	bh=z7WxCPA4rjutJMX9zvIl4o3Apaf1JCudY8osRg/hwhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7G400A3pA0PK8j8j+eIYC8HUUbJGi3iNQegJgE+WFegwErj0jqASoUrxZKHeLaeFd5b+okrRT62RoSYu6U6SvhvbxQYjbxpH4Qt06GtSaKMH3j6qFKjn6KMnij3Y2o4k7avCf8I+KWfvNxfdycPwvpWSuDOcdv9WektWnjbwdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlomzNkD; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlomzNkD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957eefd361so19148355e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786423195; cv=none;
        d=google.com; s=arc-20260327;
        b=kRAIaV0YmBGagirmxWtyB8+H76DQzRovub5fDg1QcnxV9NiTt+qdiYI1RXXs4xOp2P
         pRhInmH7rEzhSKd66xyTpsUt2d19xQP4qzRbPF2THidtIR9qZmUhT68PMliIpK8GV90Y
         xCA2XgWC+Va/WOO7M73ctqsqhJpkhudDUlvRqRXeMrG0BZySfd19z/SQ1P0jXq2tk+ye
         NQ/1bGgIEajkI6ya5etAjG51D9D+P+B3aZtFZ+gvB79gJ/CUj6+OMWBNq6o3OOWkqzm3
         S7ogIsnLZYs4FjxRG8nppBZXCV9ZypgX6Szwrb2Y4NtQ6FPeFYGvVQrLGCB+7yygtBYR
         01Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0OhMOSuXOUEXfdlbZU0t+HljDfm8+At7UQaWOLB5k7o=;
        fh=+AZSqsqnDJlWhaucGtGgGTWBkDg80rVHtscPzSjjMcU=;
        b=EoaKSwyRSp/zyHgwmQi7c2jOBD6mkvzBc7TgNcR3/TU8T8AUj8EbrmcXpXkqvk8gqw
         LqNzGniVljg8haBstsD+FAedoH/ptmZfRSmlkGN4Cpa7Uzfgrq1ielsmLmx9u3EA8e03
         MsZDnqOD3N5wCCsM3sUg5mhbPSzTIUGWm7jdhS0AqOrdV7DUE/fxex83KuceQZWSxk23
         JOF0cPIOkW6HyV3+J8swdA+gRLRAFsHzzX5f/u9nlde99dRAuDTB2qJTBiydFIYcougc
         9AKs8xQVSSCLKu5guUn3YO5537SUy+jRQdjjH+QtS+uzF+XOqesEXIkRHArF7GMFvKVA
         ygww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786423195; x=1787027995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0OhMOSuXOUEXfdlbZU0t+HljDfm8+At7UQaWOLB5k7o=;
        b=ZlomzNkDL+if6tIjtAIGLWdtz32gblyNne6sIZMEIxOjqMFw4MGV5FnwA3Q23m+IJu
         Vb7J9MFrG2NYouZqYeCe481v2UoKYunB+Sy3ryFU5jg1YLv1C37n1cnRvS1GAKoMNoyk
         MpR/UDB6izh8S94XZW0nuhwbxU4nmfXmsuFpQH5RkyFC3Cx3ogX6l0akfeLomZFff1CV
         LCaX7KcuNrbSNkEInyd1n4yJ03ETRxWCWxC2PYKbEUidgKMw/q8MSwwN7/OwgPGMXxKO
         S1KqpVAry/4A5CwLcxRFLLf/3ot7ZzzhmIie+f3s8kHrye4vOIDdV3USFEVKkasMdASE
         DbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786423195; x=1787027995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OhMOSuXOUEXfdlbZU0t+HljDfm8+At7UQaWOLB5k7o=;
        b=CKb2VnUvcwvIoT1RqYrOcC4sQpapG17oXiNGO+LTBmR+Hy2V7jRSndXNY2yy4tUGoK
         1kFKw7peJZMwE/nRp0JA8WQXCvfcUElm06GSbDIWbNLrGilapPrmkGQw/I07XrN/QVmO
         swiTygaE8lSL9UtMp9dXEQt3eZdvYYnJv6Tf2j7UqPwMMmwOT73jiBeqYzd5Il7sBPaB
         qYDaL8TgIY5EBHYQP6+M46MyC5SL2R7hlbe2oqwriMSQJ9pLOJOeEYYqulIPaDMPcLi0
         lXTdCcRmI7N772fOJnePOm0iNupK5s7Q7cEI5O016kqruWCeGEHQfx8/r1ArxHnkg0m7
         wDdA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz7vy+oXwpvJjvTXM3KB8ZE8j3tw/yKvREG9q5Cba5LrxOsij9RY69sl/jL35QFYMPNZ2ojGvXeYWH@vger.kernel.org
X-Gm-Message-State: AOJu0YyXCntuX/eWJASADYj1dDQqqMuE5VVS9u9Zyxuif5wcJl3c7avp
	oa12+I0M3tiaRxDTYYDZ+anKOU0ezg9VQjrhiXwon7mYl972RByHteY/H98BpluSV0Ao3SrmNOc
	zQxJGYCnZdGQP9AJy32N/ohhkNOHCoPY=
X-Gm-Gg: AR+sD11hmwQby/LcjQmNVB5/RXEv6zMz5Ul9necZ7Af0OY4M5PkBR43MGc2LLimvEEh
	W3fRIyf2HBOqGBrJ1i9Yam9xvhRxizwJnbe7BKqgQd3z6+ompCKtFiqGg59AEovBgSAHj7ocGpm
	bASfodywiAKzHAHjlns+QJakuQ0eS9lxfpYWLUYHTCeS4+njYvNpa/cufdaf20yWvm5iB3DLeGm
	8XAWZuMfVVjVAUXDkpLcCle/+C8H5dOzkW+n3Z2qcRIuVOwIs9qf53xVX45wlVD161aMFADxF3F
	HDbWjJjt0iD8zZKB6F/xTf73K3XxwEyQCraxbiY34TP+xRcv4dwji6AqGfpVwIT0sqUlc1FdihU
	k
X-Received: by 2002:a05:600c:1381:b0:495:5fdf:2075 with SMTP id
 5b1f17b1804b1-499783a9ef4mr9152235e9.0.1786423194546; Mon, 10 Aug 2026
 21:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810100000.2643814-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260810100000.2643814-1-amadeus@jmu.edu.cn>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Mon, 10 Aug 2026 23:39:42 -0500
X-Gm-Features: AUfX_mza-VJwrK6CpIT8Ad35vh98xr4X4uqgmOeZ7lmZ7Zm9P_j5It8RrMjWN74
Message-ID: <CALWfF7K2t4nt05a4TugBjOQkaQK=M=+wDSeG26B33znyMMzhAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 6:20=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wro=
te:
>
> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
> MMUs, and connect the regulators.
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/ar=
m64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> index 854c118418eb..dd29a3ea7031 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> @@ -300,6 +300,10 @@ &pcie2x1l2 {
>         status =3D "okay";
>  };
>
> +&pd_npu {
> +       domain-supply =3D <&vdd_npu_s0>;
> +};
Now that the power domain has control of the regulator. The regulator
should have regulator-always-on removed, so it can be powered down.

Jimmy
