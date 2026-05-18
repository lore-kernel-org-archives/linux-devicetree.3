Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E7C3822BE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124175; cv=none; b=qA1gBbdX5J66QZTredw66RoOM7DCOXJs5d6WQcE5xqquTTAAbxDiunBYEXtAkHdYK6exC7mPUwolBYjq3BcBdRU2h/OyANbwhOaNRJHjEtR1Jfg4qWG7jXOKhBRToaCNfAn4aqN1eB6xiLCP5LDtQcfCdUUHHxfvLnH/9KJp1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124175; c=relaxed/simple;
	bh=MU9oD6ZknNtzEgnVFt5sDL5QMgVi9OeLrG2xY1aLweg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oBdfckIyqq00ViociFTxc6Oh4Y+RvADXqcN3tRirl2i6cVNkLM8oUiVazKESYo9tZV+IjnSZrJolLV5gqjNBi9dMh1p42LPwoDXi4HXxca64S1LdSGA1KNZw9j1ixNyHo6SJDJt1cFJxFh3sz3DTGqOFmopxyuTAhQZ7UKtGEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THIZaXV+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THIZaXV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBA4C2BCB7;
	Mon, 18 May 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779124175;
	bh=MU9oD6ZknNtzEgnVFt5sDL5QMgVi9OeLrG2xY1aLweg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=THIZaXV+E8uvpH6zULbV8QvYgbS+kWfx/wi8m3y1yudQT1AADQa9WjcsKnu1a7Nxr
	 Ld5gQw0x8tvHyXMcUhajAmjZZfM3TYUcR54+Bu2N11QFAo7eYpmwEa2HUgLK9qTPXC
	 AjwvjJRimR+L6meDj45w7glvnIiRmWO5n7ju1ULOkec25/POLgdUjOqSPgoZ95qQ2J
	 ors07fRtFV7jvMKx96CcWdasRXrZ1nmuS0ZkoIDblnMRKLQ9OBc5KL3dSz3U9BGdqW
	 9/37XuWsDwbnuSDFed4r6ooOBDccf1cSwiRac/rTa10ME59OzMuzuaBaqiEgmKHCwn
	 R3v7XjYnT6q9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V1 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document the Hawi UFS controller
Reply-To: sashiko-reviews@lists.linux.dev
To: palash.kambar@oss.qualcomm.com
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260518165346.1732548-3-palash.kambar@oss.qualcomm.com>
References: <20260518165346.1732548-3-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 17:09:34 +0000
Message-Id: <20260518170934.BBBA4C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit title specifies the wrong subsystem and filename rela=
tive to the actual diff.
- [Medium] The new compatible string 'qcom,hawi-ufshc' is omitted from the =
`if-then` conditional block that enforces the MCQ register range constraint=
s.
--

commit 1742ce0580b168eb19f1dc60a097e13ccbf8098d
Author: Palash Kambar <palash.kambar@oss.qualcomm.com>

dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the Hawi UFS controll=
er
   =20
Document the UFS Controller on the Hawi Platform.

> dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the Hawi UFS contro=
ller

This isn't a bug, but the commit title specifies the wrong subsystem and
filename. It claims to modify the PHY binding qcom,sc8280xp-qmp-ufs-phy,
but the patch actually modifies the UFS host controller binding
Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml.

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

Does this code omit qcom,hawi-ufshc from the conditional block further down=
 in
the file that enforces the MCQ register range constraints?

Looking at the allOf block in this file:

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

If the Hawi platform shares the same hardware constraints and requires the =
MCQ
registers, could this regression allow incomplete device trees missing the =
MCQ
registers to silently pass schema validation by being omitted from this blo=
ck?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518165346.1732=
548-1-palash.kambar@oss.qualcomm.com?part=3D2
