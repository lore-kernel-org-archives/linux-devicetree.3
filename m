Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23C19D07E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768914; cv=pass; b=NbyQTSUt5Ug7vrun7pqz1m276RTYRljBWjaMq0woA4EX00WrJd16zu4Y5JTBxTcv0Q7lX5Vyi0lFA7msuKWVF3JiprzP7ELKitZiUpXe/O0naCtNHjYLxgzlkYFQrPcknBG17BAKWUh09TT1y4EtDq1vVSJMmhASK6bRvshYWCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768914; c=relaxed/simple;
	bh=PMRcSohxNKAPko8/kVl+2WR9uXa15ypsNsERd33VxbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+3WZ2j1ZTeT0Vy1rXD1RXmhb6nfFsgBKehSFCrGNCCDdA//2Z9wccsickr16JW3nMqvry9heY4ZgBXtZa0jVzj+SKIr95BZPkr23pjq7x/WTjaQznt4EFJxBrHZwJmI1ciPyaFybIsrbBRQuffGt227HrWZptNFaxRtiqfyrgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7XNSEHi; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7XNSEHi"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so1905907a12.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768912; cv=none;
        d=google.com; s=arc-20260327;
        b=FgQuGMKNpeXkhg0OnceUG7/9iZO71gHyy0laZacVDnuhEgk5eApn3HuW+kVj5K/I8b
         GwMZMpFmLwF+MZBMBeGvMbTb1atUWinXUsIn1Z3ZHqm03jX6ElvNRXk+Br+elFUmO/RO
         92CubrTjoDZB8fmHAq4zsGGw+GGu2zjP/RaCjnFkMfa/dSNe2D09XpbqttEU2fTKJK0Y
         ynDlxgSm+sUV76CyIWknPS1hmoZSo3SYEQKiS5NyO1UhPoFwKP/ztakoL8mFOIGb/ozm
         ooNa+0OXT3cyvlbv5ocd5p4pXfvxCwOi38PQytkVJSeaFtYtYKeThufmS+VbNBLluyJ7
         6xIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        fh=EE86CN5o10qKCEImnMQTQhtADzTpOvu7sYBBQwSTzXk=;
        b=bOduBJeTVRh89KqE8FKoVbX6MQhIUJAg2IRJWguBxMybbI3nQcgy91seGRBQM7okyx
         0W5WvMkaDD4ZFnU91EHbnlTRpJrOSaC6hjITvKpPIny1mhHAnk4Fr3GHkfWnlx1eGh9I
         j7W8AmcudqplN6M4HLx429SVB8P+xA6fZSWT0vSbl/lIyxFdoi0hFEes741AQgtPrbTr
         GEowzvalFwjkDaxU7xPuz1W6E+eV9ly1YyXMB/5I8Y3g8JJIwcLg4XTo0zkgKlV8JMl+
         I1CNV18E95QJSWs3h5xM2i07tq3hp/B0cVZ09JbX5iFxphq21hP4yh6hf/lN0pki75kO
         CitA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768912; x=1792373712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        b=S7XNSEHiTZ4xhvGn4cxN96dhCK81xL0SCoBh/5tXeDQlyMUZ6Oh4prqhgjzOiYCcaZ
         oOtdK5icpo+ECMt1lCdi2veP7MxUMZo52aQZHxvT/95DJB6s5GW+cqkc2E6pKquj3Vd+
         pILdjbP4Mi4SqTnplQy3uapeQ0Llv2kXLNQH55vM3Y9W40KvkQC0GwKHKdjzESaMU5lh
         HzgZy8j38kXdZbo4vMTh/eLA/f13QaQjTE+zx4/r4+xTkaECSkVLN+E3S3Y4D3FKVy1N
         9wOOemiGoprhiMS7VRbg88oeLTUEkxMjBow5ve+AZ6iuN3fqxh8bT/Dsyq6NqNtn5fea
         1iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768912; x=1792373712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        b=YrveZ28xgDOzYYnBDqF/EHXKzQzR+kFlmx+pQCeS/+faQwGwT9JCy7q4wSorfx10wB
         rd4fHyCKATzIOaeqw33NylN81w1gS3fR7qZ2yS5Oz3SmxZmDtqP+hoh69ITw1NTCXK5G
         QCERO/RcOU8wrJF6u7+jlLMkQSm1eqTIS1mi6IHCMo61gYDP/NQW0rd6Ho4yGxwKUrIW
         kqiAVzYW1pDxe8PcgGQ2wHJtm5abBjqhciQTBKEeIOClvLiwcdCTwzx4CPcNFIfuICRT
         i5HOs4bvzwvICUXF07AlU7e4xaxoVXTTALu0iaXqTEJu7sqU/v5BN1PSDw2HYDFin2hC
         r+DQ==
X-Forwarded-Encrypted: i=1; AKwUvByVykc6vYo0NR+6fNCyWhnPaJ1CMkYhPHYP//2PTF9b6jiUDHJIgfxyvKxfUOqFOEsSQSwN1WAirLmV@vger.kernel.org
X-Gm-Message-State: AFq9FYJxQy1bYrqpPQbxaLqXERbClA8FFuBJX7xXNdvycjbqzCkNBbA5
	QTPaXSR5voUT8ix0Qzn+1RSiSQ/0V2cwQIRprkDXnNsThActkrSRutfY2MrtxGccYZ/lKxD2LNo
	gkAE46L6g+BxG5Dj7YntlIkSP/wskKl8bSUGGsME=
X-Gm-Gg: AYBFou0uJ+kPVwU9Zco1s/S4nHMjva36fk+osEgDtc6k6c7X3GuurUwKEoiwnDU/rz6
	OM+t5pgbqjjzaaO2fvu5nAsj7eFVCt487th5HhenVamYcWdB5AdvKeFpvRgQJRvg0J4kVlCLatJ
	KwxQrf37kERh3KL6C6eByuWfOGTovAaiKvbvMSarjq5Cic8m8Y4pJ0j0G2FKQbD/OQ9o3C190wM
	vAinNjkNTUD01jwn7K57890VAKvKY3Dd9vw7TxLwZoc5y8rbfoaGQSHq11FGET9c2DqvL8tMGpB
	BkMKOj28/Oa2OpdbMIENmxF2gHdGOfscTQ5LNIyl1spr6DqLlKBOzJM=
X-Received: by 2002:a05:6402:a0ce:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b1bb19e48dmr1653193a12.25.1791768911701; Sun, 11 Oct 2026
 18:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
In-Reply-To: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:34:58 -0500
X-Gm-Features: AclHuK-wSHQEHwchdDebJ1vxNqwtw8jXYVnXM3lFwyE-VJGEOVOwBXaUkTBV1ZA
Message-ID: <CABb+yY2XUPngcEVBoT_pQGgGjYtjD5iWJDMDXJKCtq0Sg+fBVA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPQ9650 APCS compatible
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:18=E2=80=AFPM Varadarajan Narayanan
<varadarajan.narayanan@oss.qualcomm.com> wrote:
>
> Document the APCS mailbox compatible for the IPQ9650 SoC. IPQ9650 uses
> qcom,msm8994-apcs-kpss-global as a fallback, so add the valid compatible
> string combination to the binding.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.=
com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index 39bc374300c3..11f4aaf256a7 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -39,6 +39,7 @@ properties:
>            - const: syscon
>        - items:
>            - enum:
> +              - qcom,ipq9650-apcs-apps-global
>                - qcom,msm8998-apcs-hmss-global
>                - qcom,sdm660-apcs-hmss-global
>                - qcom,sm4250-apcs-hmss-global
>
> ---
> base-commit: 41243c778cfc83f8d70600be6dcd0c7924603aa8
> change-id: 20260826-apcs-43612991b1f3
>
> Best regards,
> --
> Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
