Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED23DB64A
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122960; cv=none; b=hNCENwXUkh7MM1ERVS15ul7QmWzlYpvtP6ddhcPMfOQ5wARVE0xImTa86F9FogYiVxNWZFRujDYA61lSK5EeQhPZfZY6a1hwbB9zEv8HUgCjBMMVvnnIGwevIIQx2IhhfTxYC6oI0a8zgqouJ4MThP4OQ5mrhaFJaGvvLn/itOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122960; c=relaxed/simple;
	bh=1AIHSQDdpxGUKF/1KjyALqNJi+6iU5/PYRAkOquwhpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjKvPBc0iOSOYIhu4wBC15FW+7TmNQDgAIZRoojoQRvhHncM/UsG+3g/d4JkjekVxz6737XJotzJkj7UqhVcSHNo5pBWLvQL4K52lQVHO9kB8FezyKh8OVRZVyjKefzAEymEPxtmYjKrh1S9mvn0/uqaWCq+xIgQFRxbICJzaMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHcxWrVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ML7hzHY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHcxWrVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ML7hzHY0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328dFR91249633
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWHpdeWbui5Rg3xQQVmOU/c9Mip7VYP/vmE+LLZxhfY=; b=LHcxWrVyEUq00ReX
	MFqLAJz8RRjB9wLl1lQmxzpCpDECONV99OKhRh6JAwIdubx/5MszcUn8Hdia+EIT
	41mdnhiwmYeqbPFGg/oj4h4NltHea9KQKadyc/pk4/zQ5nU+n59B2z06kp0iN2I3
	X/EfgkyhG/04RsDZxYeFUwNTp3aRfLjlASXhshklQ+Dov3gazKaeloeISpmnDtC3
	4CoNZjwh9UX2d2rEAOzh0gNtA41VoQEa/I5sjf68KA1LDQ/G13vnyCP9bmG0k+zr
	idQU72x5OaRUjhFFXwdBiSJxyE0iw9ZE6sfuDdXxj+gAVL/p/SbJJW3R9Gx1QKwB
	NmVfzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t08mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:42:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so23064485a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122950; x=1775727750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWHpdeWbui5Rg3xQQVmOU/c9Mip7VYP/vmE+LLZxhfY=;
        b=ML7hzHY0LPKdqhVZMUVG35A3Gopn7yO5zO1+CRW+qnithVh9AI1PgDvQ7LAx8R5LoW
         9dsLGjwiXeQZhJtaD7TLvukcSfHnIGez581UYP6NQrNvWL4//XMkW5P/HWOmg1nnqzjL
         29XfaOGpSpbP8Izabaqh11sW8u6eRkgG5Uns5ciW034Fhk+qsam8O3IW8AKTtMGFcC8t
         dzSRy2bGiY/zDqP5/l4vwNIxMjMrKSelgPsrZRe+lRe3spAWtJ2TlBpkBlmbA+9TGcgs
         WZGUWGn3pKrK+OhkX3n7dHaoWnOaPkgtzhgCpSeSTGC3EDMkTD0Efp6sxhMSX+f5d9Dt
         Z5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122950; x=1775727750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWHpdeWbui5Rg3xQQVmOU/c9Mip7VYP/vmE+LLZxhfY=;
        b=VIgBVQ6aFrnECvFyGTvCg+v2wt7UKj4h0mYod/ELHakUQfdeE0XDx58Jqu6FSyxIlT
         3c8po35zd6KmAoHQlh86elHEfBi2E9C3R5jnGDU+jk8rBsgW2mQdHANxWxkjDKhDxmzX
         IhrCGM8Y4TfBu5cdcEJXi0fw3Zv+oTgJYG7yCObu9LJkdiFezFlDmIiHT+HqupCru981
         PBhjrPX6TL1j+9IpGpGYOUR8nDiF+bQ4ZXRkp7DaBkcQUqj/xR/bUo07wNNSJy6YNAzK
         KpKKQduHkgJNlbvH5BvGbPXflOnVcz5yalHwF9zcXed/rmdBSbVQG4nntI40lr+mlEKF
         RZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyMUdhqLeEw81y6l+03r3TLy6VbUjd8Hym8o+Grs4xzN/WdMs2fnzV0AzYNorjTAoCYVvg0K0Qszvj@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSaBVHo5uk1cBkefKP2n8M/bW0lUCHrokZPGDwA/NTsvhfYqn
	alRBM772ELjgTwfgsVBcZceS54p/jUWgeaG+RQhJ7khhGaz5kILJAsdgGmmNrtYzUPql2z4JUA/
	jQzknHzhN7VhF+OMXLv+bfQouGcacmn9oRrR5pH3D/2299KGtZ5/6LgQTFBmjWUhU
X-Gm-Gg: ATEYQzyTpSd/7eWzIuIcS4vVgId/CBjYExk1ZYDHK/TlEewwHnI5mpwspLyf4ohT+Zh
	BdOL2SASoQjR8nc9cdoDFEjctvXMeB87jb4OMw18cRiO/ZLEjjD/vb6k+mpvq32StqlrCOSZs+e
	4RKvz1XGo2XRxja/4zdTT1T34Jg7JALbmHRKMGvrRimAa6I+dUaGQnPj4Kmi2hATNIrIC5+3HM7
	x0FeAxlLgdYxC+YZQvNsjngxXBGfZQHfJH1D/TADfxB2ZtD0X1be9ca/wnJD9zQM1W5sMvN2fdz
	UwoXfMV8MfDz3qAzXqiNwnXpCa+G4UlNdD252uLT0K+zN0DbyP8BdgchkmJmTiB/dTYi0f4rpGX
	Fdt4UaXRD7v/dr1UPx52LqWyyAppLZAxSprIUXKeEZKZ3wiDDrZ4ziskyouH3geq8zZ2r9WNRh8
	e+SbU=
X-Received: by 2002:a05:620a:4156:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d1b5c0ac51mr680210185a.8.1775122950123;
        Thu, 02 Apr 2026 02:42:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d1b5c0ac51mr680208985a.8.1775122949644;
        Thu, 02 Apr 2026 02:42:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d36f16sm573732a12.3.2026.04.02.02.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:42:28 -0700 (PDT)
Message-ID: <6488e6e7-726c-4f0b-a6b0-2914b04e118a@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:42:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: eliza: Add display (MDSS) with
 Display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 78dd7vO0A3tzNsyirpLP8pXCFWaT18X0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NiBTYWx0ZWRfX6Ta3D41rsT4y
 DRXV6lRoqDUDmbCBw7hwIqlVWFLs2RlhQhL6z4a5kJTdGfogxFojLWNpDumt2Mmm10FRIqWbh4M
 +MP8yJj3aUofFG9Ey/0sxzBHD3Z4lR7b7VBocx26p2ilI/x79TvqBafB1VlvsgFcW5Y1C+jQK9y
 Y7UcDP9kRHD7Y49v92z2CPwTiF2lPPPy+WEILAy00hg7KdKZBVui7CRPGZYbYVqESJ6WfwOEd5g
 2VDVxWsfpx+tQojpdiaQnClAMLqOf7g8oCruz8Em3UJqHpAzrNRzc02wnx2yUO2loCWocrDRGPP
 vUrrXt/5P3/91dEb74KL802xZt0TmdHwJdT22rUw4W4Tf02KTf0HAWaLamXXXWcyzJ081PHbb7w
 5IRTDpOlxDAaBoIXKacLGcjHvaxZBfIcpqQjzZ2/z76id5otEHCIWr5x/4gt0y/xSimMgVPhHIp
 IhtzwztWmOfV3Kjeggw==
X-Proofpoint-GUID: 78dd7vO0A3tzNsyirpLP8pXCFWaT18X0
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce3a07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dN0IigM5nE1fyUEilRMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020086

On 3/31/26 4:02 PM, Krzysztof Kozlowski wrote:
> Add device nodes for almost entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Missing pieces are HDMI PHY and HDMI controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

[...]

> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,eliza-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x93000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;

sz=0x3000

[...]

> +			mdss_dsi0: dsi@ae94000 {
> +				compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";

linebreak?

> +				reg = <0x0 0x0ae94000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupts-extended = <&mdss 4>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +					 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +					 <&dispcc DISP_CC_ESYNC0_CLK>,
> +					 <&dispcc DISP_CC_OSC_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;

Why the source clocks?

[...]

> +			mdss_dsi0_phy: phy@ae95000 {
> +				compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
> +				reg = <0x0 0x0ae95000 0x0 0x200>,
> +				      <0x0 0x0ae95200 0x0 0x280>,

sz=0x300

[...]

> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
> +				reg = <0x0 0xaf54000 0x0 0x104>,

please pad the addr to 8 hex digits

sz=0x200

> +				      <0x0 0xaf54200 0x0 0xc0>,

sz=0x200

> +				      <0x0 0xaf55000 0x0 0x770>,

sz=0xc00
> +				      <0x0 0xaf56000 0x0 0x9c>,

sz=0x400
> +				      <0x0 0xaf57000 0x0 0x9c>;

sz=0x400

Also missing regs for quad-MST (Pixel2/3 @ 0x0af5_[89]000, each 0x400-long
and MST2/3_link @ 0x0af5_[ab]000, 0x600-long). I don't know if the DPU can
do quad-MST but there's registers..

Konrad
