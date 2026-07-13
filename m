Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E47D3932CE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929159; cv=none; b=u1EeYYWZ3s//hIoPCZG40U3o5mocUUnrt3krfWW0bE3lulPXPLYPXOaxL4qnQgPJpuWVqvehdF67dikdDFphJN43nKWagOR980gv2aj45VPBWDUMo4zT/oE1ilaZ7IbRRRXJYdebrZ/zBnsZeYTeesoovX/a7Iy16l1n3ePOrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929159; c=relaxed/simple;
	bh=NpBVJ1ObbAHtpKXjNp7Ma+WB/fNqPGXMGPs4snuzUkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3GIb22WM46qBGIGAotSB91ZReyZh0bHZtmsw5J5tn7XpmvAQT4Osx2JGs4/vSTvyrUSA4HllyWuPc+tmn5GzF+SdekP5Nd8qyNBIZnLkBUW1gUfDWXzF5hbcgqN3yLBtXpZ8xtCOH0oPAh4oYM/B6XfjZR9Inm5MUTVFgpCwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxl7nkcm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv74hf/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxl7nkcm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bv74hf/q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nn51732256
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKP1c0YzrE/bCD6Whof6pdNwDq9ll2byc5H20YulvrE=; b=oxl7nkcmCHy5JSc8
	+m/E1g03HVa8CqIjCrqCHTyyDUWuDnm1wHEtUq3OVtdgmBpCnzHdx2m8ZqPaykaA
	ta1jahEGADCZ7PSnjx/rx8OXVVuqWgiSYgFGlnmmBfnlD/r9rFaRZwwNBCyB6+oV
	UYi8vldWlwosEccfCbmU+kE4nivTNYJQ7wSYltohnd8G+DkfBeKb4zgjnIAg373G
	unO2s2qkh0qCpM15rmj2T9F0h+Xufe4MxH3dwRNJLKDU/OxWiHWThm85E055Hv/y
	CGHTIycUIGuga3sGbviTAgIVKx/IwvakoNt61lNGSeAofly04xxMnFq7IXHRkYSI
	IP0l8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39gab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:52:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so5886401cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929154; x=1784533954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKP1c0YzrE/bCD6Whof6pdNwDq9ll2byc5H20YulvrE=;
        b=bv74hf/qvdzaaK7mgt+tm9jSuRPny/pmZkAnI6kuPulR/HTD6Cd+ki4iMg8/kXGs51
         G2N5PzlYZdIVQ3gsUXSkqVXibnhQu5k08AtO/9T56vhKtvg1W+YcgQLDRPghGkmzMPNs
         sFTffN9lGx+ljWxj2z2dQvDbc8gJgdhzyvyoq/La7cepnns+CqxbZ93eq6Se0uT9G9tG
         tsAmLpkIGU/HEAAPopKWLo3Zzce5pgEZarUHQrVvzZ669w60ZMx6jdRFSsAUsl29ChJ4
         pE1Ba2QS0F317vIpyWRZubb6nemW81+S1InLmEBiupmYQeY/4/lD8EMsXHxqcMnp+ukU
         X1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929154; x=1784533954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKP1c0YzrE/bCD6Whof6pdNwDq9ll2byc5H20YulvrE=;
        b=GSSF6nmgFY0XSpWrMLjj8Pn5TdPQnQWfwAwUY8dGErdcvTQsrVeRsfTFg/uD090LRp
         46m2ZWZjvJyBm755Nl7lft78sVPDJ8UQ357TpKmJxLyE4R4eTov7jYNC290avbXP3GUu
         8dAMgi4T+Pn39EmH5wuD6za/Y3tegGCWtcIRC+SJT9hyJF53ztVbfsomp+R+wF95dl41
         Clz1VSiWZsuFwdsDkH/ZSStKeb6WmEMAOsXR5H98a9x2bpyp1X/CUVo5q7PPO7vaJD2e
         zL2mcTCfDKigzNftsozWrwuoEue5VEXora5Tb2uNHr7sE0admhP7pGxjOH+IJMUN2fTw
         lWBw==
X-Forwarded-Encrypted: i=1; AHgh+Rrx/rEydOcbndzIuUkTsqbcCG4Pgf3esbjr9mFflLsT4GfkEP+9SguvjyOrw+imq3iJMLK6e0O2SIrA@vger.kernel.org
X-Gm-Message-State: AOJu0YxjROEsd4+nBi3S8eoun14Y/1zB9vXXU+zF1EwK8xDTiV4M2Pz5
	Nz0zfIrTbK9zy539Hfsp9uxNzFjqtfEHhuSDsTI14huMJfe9eFwnRv7RMlW9VutkdQ0x8nTszwo
	PMK4JJ7HHik+VvPrl1ghvOE6yIJowrsPK9PS/9HveuBRBCwWySftlZ8R8Wkmv4xT3
X-Gm-Gg: AfdE7cl/n055gQGvxLedSgFe15C4Wnot5KTU6kpPyUhSvAgOJqzBgm12Kiur7+yBDn6
	1/UAJl4e9xnrgy46jTb78GUnFO3UJXkrAUwuAjjUyM3TnLD+oNDumTfpgJwh53oFXYdEBZ4HZ5m
	2COkGY+9WG2JHrKYJp95hDYONJKGkYlogKR/myzndpqcr6bhFMzuoVj3QNb8y5gilnIRDpwbuo6
	u3AX4xMX9X9Br/qdY6CKdhpnTDcD59ZQQP0www4bj5bRHewF65pLvpvr/lWrZ6OvuevBGI+onSx
	hCs7XKrSFP3usF+NtSgIFWGadyC7pmP2cAJlUFSa8/IXU8hFvNLLEDsjx4QDU52yst3Ldk+yyn5
	PC3r0kup+Slld2O1hlWnD/j4n+n/9LOs1y+U=
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr58881141cf.9.1783929153687;
        Mon, 13 Jul 2026 00:52:33 -0700 (PDT)
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr58881011cf.9.1783929153206;
        Mon, 13 Jul 2026 00:52:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm942161566b.5.2026.07.13.00.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:52:32 -0700 (PDT)
Message-ID: <3f923649-34ff-4089-87e2-8989dae335ca@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:52:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Oleksii Onchul <oleksiionchul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711184934.55701-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX6Xikywi6EIAk
 dxORfdxsph08u7ckNkyy8uakyHzc1jbIYTRwiNSwot1l1dmF1NTYS3ssssAHnR3WxUrdYQp0T9/
 +D+Bs0ctEiV9rGgWlPww21rOX0RXvrjigQViEcR53ECnU8N1wEjD/QAeTKBaD1EUirFFoogxK51
 YwSYT5i87qv0xB81SB6jMa0KSuyCgV51J67BXB+y96aRTIk5N2wWOQ0F7aanVe16qhQ8O1VzcY5
 vUaM3zF0augf86kubtff6JWYOvbzl/SZ5c8EYVsJcpNOCfpXy3tdTVIAk50ItTsXKt7U/b7kM38
 JBReDeJrRRjMQuV7Smhp72//o/3THOcXy0zqkhBBUBByK2vHlGgSfdzve9IzpuSlnQKvE7IP8Ob
 Y/dcflDtFqYqGqQCX31ywWXpoJ6/PA/tvffSbcAmU/Fk6PK+6OmGRrK29v8ZbkRMZEU9FEZrf7w
 s4iTjyncFoAUMvJsLvA==
X-Proofpoint-ORIG-GUID: YzD5wzpfXRtS-Fml5PX-rF7Zhx17LqWX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfXxi5k7CU9Hrwv
 OEOunO7tsJ1+gwP5r6fAcN5Y5XYJsONxSSFsnFJpRFg+rE+Q6+DHBFnfG3sH9LAg45Tuze4na0i
 udHMMSJwZlujlnAdleXK6G7nQjZpFS0=
X-Proofpoint-GUID: YzD5wzpfXRtS-Fml5PX-rF7Zhx17LqWX
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a549945 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=JiISQnV02i8F_HGE5KwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130080

On 7/11/26 8:49 PM, Oleksii Onchul wrote:
> Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.
> 
> The supported hardware includes regulators, UFS, SD card, USB, GPU,
> remote processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal
> sensors and the hardware buttons.
> 
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "serial0:115200n8";
> +
> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;

Please use memory-region instead

[...]

> +		ramoops@a9000000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xa9000000 0x0 0x200000>;
> +			pmsg-size = <0x200000>;
> +			mem-type = <0x02>;

Let's make mem-type decimal. Don't you need ecc-size for reliability?

[...]

> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-always-on;

Many/all of these shouldn't be always on. This PMIC normally only
powers cameras, so dropping this should be fine

[...]

> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

These two fill be folded into the SoC DTSI soon

https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/


[...]

> +&tlmm {
> +	/*
> +	 * 32-33: SMB1394 (SPMI)
> +	 * 56-59: fingerprint reader (SPI)
> +	 */
> +	gpio-reserved-ranges = <32 2>, <48 4>, <56 4>;

What about the <48 4> range?

as a nit, other files place the comments inline with the ranges:

gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
                               <10 2>, /* OOB UART */
                               <44 4>; /* Security SPI (TPM) */


[...]

> +&usb_1 {
> +	/* USB 2.0 only */

Did you test that (with an actual USB3 cable)?

Konrad
