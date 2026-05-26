Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E363CE0A1
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788226; cv=none; b=aP46CdIZolVW0NyERZHYl/AE3Jn1oPzuVp5gEuYBRrRhoCEvGmTe9c0p+i5+6I0j0pKN8+18x8ZFiXh42dKEdNZ2vX+dyt6mgNOZTacreZZSh9toI71th/K71iG4R+tKkb/yMVBuogP94eCxWpi7Ze5kyrI/pQeCFe2XGLQ/AWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788226; c=relaxed/simple;
	bh=d5zBZkcEf37y9vpEdjI3Ey+iwV7gQTtSgCS81wQpvM4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NHk1mYkWmlEOP8q3zZOR93uCgFsjbreOUSesibYxY+fo5vvyW9gr53heWXbF5Iypwqtqlh1b/7w4z45dslZNVaT8iK6X4LhncnB7ckj5c7lxBOhWwFewU3BQodrjhP+4TUBhyADgkTZzFnPwtVR/FerJgbfPNomL3zjwiBcduyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQcCFQSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQcCFQSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFD71F000E9;
	Tue, 26 May 2026 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788225;
	bh=5YVj5p6nDzAUgvsCP3gk/NVlrFiDlp9L2KIsR5vlaik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gQcCFQSw/MDOnvUOOQXh0JcTxiIk2PuxPYbK33ra0GzfJICC1MwMnU2+3v2siKK3m
	 /rlGz0sFzL36V1JKZT5oA3+hYKUv6b+czwx6fasJm0iHWZBO4NJsyMX4czkmWcvee/
	 Yu+kbzXCQYUBwh9vOwk597tD/RMrMpoU1qojMgt6R9PZ9rnDWZ1+lw4UJYviztio7v
	 CukDQYY/lVFVhKFI5y8YvIMboOzpr4EAMRsKWI7JG3CHW9ef/CT0e6YqYXXxH0QCw5
	 N186yayuNAPnEFpNaDm4Lb3JqJSZPzKQzhoMBABg8phFdXEi5fjI/nknIeKTPEb32f
	 wVmgpcp46Uu3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] scsi: ufs: qcom: dt-bindings: Document the Hawi
 UFS controller
Reply-To: sashiko-reviews@lists.linux.dev
To: palash.kambar@oss.qualcomm.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260526090956.2340262-3-palash.kambar@oss.qualcomm.com>
References: <20260526090956.2340262-3-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:37:04 +0000
Message-Id: <20260526093704.DFFD71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatible string `qcom,hawi-ufshc` was omitted from the=
 existing `if-then` conditional block that enforces the MCQ register constr=
aints.
--

commit 6ca85cee3094310081f09881b4d6d6a9e987b327
Author: Palash Kambar <palash.kambar@oss.qualcomm.com>

scsi: ufs: qcom: dt-bindings: Document the Hawi UFS controller
   =20
Document the UFS Controller on the Hawi Platform.

> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml=
 b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> index f28641c6e68fe..3de00affa4c64 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
[ ... ]
> @@ -27,6 +28,7 @@ properties:
>      items:
>        - enum:
>            - qcom,eliza-ufshc
> +          - qcom,hawi-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc

[Severity: Medium]
Should qcom,hawi-ufshc also be added to the allOf conditional block that
enforces the MCQ register constraints?

If the new compatible string shares the same constraints as previous
generations, device tree configurations with only one register region could
silently pass schema validation.

Looking at the existing conditional block lower down in the file:

allOf:
  - $ref: qcom,ufs-common.yaml
  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,eliza-ufshc
    then:
      properties:
        reg:
          minItems: 2
        reg-names:
          minItems: 2

Does this if-then block need to be updated to include the new compatible
string so the validation remains complete?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526090956.2340=
262-1-palash.kambar@oss.qualcomm.com?part=3D2
