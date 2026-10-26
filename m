Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011911;
	b=HMOHYjjHNHiEKbAGSfScvdT6v9XOhsrNjZ+4OpUtiZgp1TVV9Mc9R7n56tLcIhFQm8Jf
	 mqGnSnnreL+Pr42jjdJthHfMGPySo5d3vXGTcHKiqhcP5cZ+MyX/yEV+CcbuZCkzOGpAD
	 tXt5WiOmHS94j9wuOclDzRGZagiB19hPmJOetG1a88jZ1NYzkFb3QiOuo1dqfsdRWbL2V
	 pENqYyfa+Xant5DgIIv7ex3RXUovBN2TON8zbuOJCUyjC1gStTNcm4H2TgbGmvHVGNwzM
	 gpNwr2TGQ9+554xJwG8MkyptbULeCn/6CRjZPU3h7UCPfj2opLIJ1BMEaOrJHgAOfbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
	b=M1epXZURGxXR5xaytsOodTzBCpInMQYZ5Di6Qo+/5rcpIdUzPtxRh4gF2WDG6/pVWn35
	 6OHeyM4g8+o/gaR0XRA0SQKv1DECutcklaChrjbN/fuwY2KILolVD2kI9anJyCq+ZEqsa
	 zPTQXywGNNqinxDuh9uvqWWIfsjiGID1FpmOLa4gfC9jz/fLIV2rpxTQ8vbZy1vdtNDzk
	 rfCZQyRpV0exA4vj93m3CTka2I3zHgy103aiSg33gmREtBC8j2O90XbdXIV53HyiQvLXZ
	 LqVYbUWuVIlDnNNu27GALVptRxkftHGynaihk8zngMU2pRZkZrgvecu67OhS28V7CLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzVAHkr4;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2999F606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2999F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzVAHkr4
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1510132f8f.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011909; x=1793616709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
        b=XzVAHkr4KWhp4SR2WwzWQxCcMQaShtXQTlQewihtNNAK1hZbhAGGWkFVNIWtDj5tBg
         /gD5ANjWnHbwfvhif89hJqLigAQUenx1D+8TiKsF1DHrhMImwKFR6pYxmgg6erew40sf
         aI/3V8zvt2t1A5d5wSFIBBoz8mzW+ZGPW8iUitC+gOiNnGDHSYsesinfxorfPqqzsURJ
         OsAm2v3Iib9vHikarRa3/4A09l9F81lyojFEgbR7Ym83DdBlp+HCylhTV6PUEdzCSPWP
         mhR7EbbrdhAWzLqKssx3G8ny9998zK4hW8qpOIR9ljdEPGITQhnR7z4rK1YfPLG9dHMV
         alyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011909; x=1793616709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
        b=MfTHc684nOxJOT/meVTfsBX1dYDu0EcL1QOr44cOY3ILB7NSp4X94XEaHARjWt5H2g
         zIfShC4xZnv8QRQ1T0juXrN2c7nWi7RsoYiLdlzGr+79y7imtfmM+j+K7p7sdjhR5Ju0
         wO/FpovgcBV9y/6QGWXMB7Os1hFD4Np9eAEO/NPCrFd51mj/55FbFm5/gHnrPCjJbv0U
         Y8CqbOHqU+QkLzDaiPHvW3Z800ET+LJ2xzTz0uq/gSKd4ruJvzAf/a4fW7QflQvTOnZk
         8+c3x/1/div3mPSGDleJgF9aYBlid38/i4vs3DExKHkipc6VEpWc+CSrDprQqJhnqjdU
         kjaA==
X-Forwarded-Encrypted: i=1; AKwUvBwkVf60P/nGsu5iKYzK6agjxZyUGytiA7ezMYrIR9bC3UoJjFcWX7yCH2LySL0dn9+GzDyJA4D+qS8l@vger.kernel.org
X-Gm-Message-State: AFq9FYK833/wRIyIj+WsiQASuSdHXXaFqUUmTQv+8b2fCNxRSj76GsTC
	XGuMBZgCs9+bm0wZhm8FG+osESiNjV3gjx4RqZf94mKiVbcr8Uoo5XGG
X-Gm-Gg: AYBFou1dUsluEeWd+yd7+KFTesm3APfQ83tD6wkoPpJyFcle5jEsWdDNaqKtjB74Rf2
	WDVuhLHm89WvfAltNPDelWExv5oWPq8iglWJEHV2r7o120JeiO+gQ69opaX9wV+SiZ3CqmNwrYK
	p/8AZYvL8+Cx1l3JuHtWbBGjDoS7wRVGubZKQFAawFtp3a/4ZQ6MI5pQHYFQeB+MSGBcqF53pz4
	AnI4Ac02WoRYek48VQhA/wnTFGqbP4TaRfij7uQpORMxFc8itxs57ptRW+yhFl2UoIKk90O1//1
	48e7J39tk4SoVqfxjWr2fw2LD/mx4uXMlJVC91LdZGf8sncQ/FrA+p1O8h6kPiOo1l81A6uydWU
	ocBbdtIyOVMhQe7XFrlgcxkv1NAKl9ClNukrBpb4n7mLxy1+leM6Q5Zj9tug7im+sbQyn61P6F7
	CiT/QGcbbGP80u8iB/CVTOvg+wnwofgpqt0b+2rtiIdQCXzAbu9+Wz8DlUVxV0iK2RaeDmIiwbc
	hX3C7AYRnurdJel8gjICmk4hhTfcX1MUQhJizwHTa/k+Szkkci24vyHTNaJJC09i8RCszw9Q89D
	wliF55jvbS/R5arEXOgWeZPg396DJIFeyIV/UhLaK256vgoot/c3IoA=
X-Received: by 2002:a05:6000:2999:20b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48e3eb2b9a3mr8914050f8f.3.1793011909237;
        Mon, 26 Oct 2026 03:51:49 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm16077045f8f.47.2026.10.26.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:51:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:51:47 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Message-ID: <xrszqxg7ketpbjtafssgyjdgygwuhqx7p2ln3phrabcinrqn7c@vor67puwvmyd>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>

On Mon, Sep 07, 2026 at 04:17:20PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
> selecting board-specific calibration data when the device identity alone
> is ambiguous.
> 
> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
> device tree") implemented support for this property in the ath12k
> driver.
> 
> WCN7850 can be used in systems where the PCI device ID and machine
> compatible are identical across product variants, or across regions with
> different regulations. For regulatory changes, the hardware description
> does not change, but the vendor-provided calibration data can differ. In
> that case neither the PCI identity nor the machine compatible can
> identify the required data, so DT needs an explicit calibration variant.
> 
> The ath10k, ath11k and ath12k WSI bindings already allow this generic
> property for the same class of board-data selection. Allow it for
> WCN7850 PCIe devices as well.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> Changes in v2:
> - Rebased
> - Updated commit message
> - Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> index dc68dd59988f..cf3e1fd99c12 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> @@ -54,6 +54,12 @@ properties:
>    vddpcie1p8-supply:
>      description: VDD_PCIE_1P8 supply regulator handle
>  
> +  qcom,calibration-variant:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      String to uniquely identify variant of the calibration data for designs
> +      with colliding bus and device ids
> +
>  required:
>    - compatible
>    - reg
> 
> ---
> base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
> change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c
> 
> Best regards,
> -- 
> Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 

Hi,

Just a friendly ping on this since this since 06cca100ad08 ("wifi:
ath12k: support calibration-variant from device tree") has been in the
tree for a while now.

Kind regards,
Ernest

