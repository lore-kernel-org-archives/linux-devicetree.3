Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200C527A462
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104673; cv=none; b=PGNa+AIjsrDPbqjGnTV+hgbHvuikh2c6nYSoFbOKFOeJzAb1sZnWHmccc+m9/mvacSBrO2QKbTHBBbNANKIYpqWs3YzKdLII+r6sbkaOe39mueuOMIDlNWwiDe/mxkqBlWGTrd+miu+9855GGoaB6JceT2rk9pyOFQBk+xG44hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104673; c=relaxed/simple;
	bh=AgIcKUKxDlCgW6U/kszhR4FW2rEpaaGgBGwYrc4s2os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8/OJRmI3YSBTbF5mfOgrrdbixB5+KHfFWvysWv9/SuAR9OL2loYEd3to8zA/rWl4lit/fwR8sz2qWE81GVqKQswmKtXIE80pMpDXmLHL3ZEF3UxCsyo6TK4Mp+CPO8M3P8Ahud7wQck5wTeQ/Jiulsty4w7PP7O2R6MdOsXbhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNRcAChD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzgxW/i4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNRcAChD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzgxW/i4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA8SPS2090993
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crnJptzUEns7NytfTpu/gd6vjFfjq64UULyy/cb5MAc=; b=hNRcAChD7hg/HwgQ
	k7/8BmqwwEWZrWpDuvAYRultwSlx0F6PkPMO5fsQGtTUQG26Azi/KcM+nS6jAc7a
	onPpiSqDph+bB92du+ZcBmRjhi4VdcwJRutglyCRniRuwlxq7QW/F4dPe68ngpOs
	3warPGI9Ir+TfFXNVjo1fyixNLEwv4PbolvWUotxpMHOFoq072D1XDrrNpNwWnQM
	N8HOvC9yc8HS3Tyrq0LxTBhT+t1cr6vfmN8JLVX3Z5FdZlgM+3TeTJMn92MAtchb
	zMlfK2Gnuak+jKOpqkKbkmtre2BJ6r/Q184DJ/PoOuSTtZVw65ZzVcbb9JhdyjJA
	QtoUTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpgc7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:44:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so5917811cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104669; x=1779709469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crnJptzUEns7NytfTpu/gd6vjFfjq64UULyy/cb5MAc=;
        b=NzgxW/i4OCYKhlRzYU6W5R048IbBMl74nthOQ/C3KFA/wlnd+nV5nPOiB5/GVhLFC+
         tV1xTZKgoUEMtjW8WXd3jvt2tIpJjnqvSWzl8FoLWDMASqiIL1Qn8X6KSFJkKuZm+rPp
         57v3zcSmZkj3hhlEjZ5VIKhsfr3NvRaRI9zaHnTGz7JyzOW1mflzA9BlEjhPgsWNw+VM
         B+YPeho5tXNNHTHuojTuuWJjD7+HnRnVxPYIG0TUj5HM2I8gq7NZggzsjpeImbL7o7bZ
         duZBI6k2984/uBtNIbBLi2zDOUaRc8snUBXMwXPlsz6viGxnfNf4TKqEuagtiengmzln
         upFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104669; x=1779709469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crnJptzUEns7NytfTpu/gd6vjFfjq64UULyy/cb5MAc=;
        b=O1SwAU30zMRuVonLnad8tfEE0NVzAb2vbnWwLRLRek7SJ2vw04vx2oPS4w3CjZFQlr
         ONSNY8OA3FSQofD4LcWPeMRY18rpQkReQI1m3qaB8gTrYFy37UQuSASXXKa4bOcOjxPm
         FrCHq3bAT7t8XbC7NtccCvbaHRrc8dzt8q0VLJ5sBJl8wviQroY3tqyF8nIiANiKEeCZ
         toi3mHQqHehN1qMarEkJuG1GXIj3DoYmPJXBz3o3gsEexK72dXhk1FoAOiqoRcwKUOdu
         UJCemLpL69OaThyaXKL0sVN9Z0nui2z3v69h5KNfIVeIu9ncWcDIhTS+pQ0CnOrKRvQj
         YGjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9J3W+Po7/H8LQoDaUANI4tXS8Sf02GXbmpPk2s/9d2R6NmyJig3BWmwGUbVCOtwXoHnlRqlgtsXexB@vger.kernel.org
X-Gm-Message-State: AOJu0YxOX22G4CJ8ansXv384lI25WSEF+moWIY+2PlIzFZtOBGnkP1LF
	p0igKCXzTUVn6W5164mbtm63d6RbW6YSaTM+OYyprRSm9fGM5b/Qb8f/MEadR5X1FSdLCeeoL2c
	OoifYJKExsCVrMFQoDtHn1e1z3eP+X6hzyC/8UI9J+fmX5CgSLGO9HWtjXA7pY9zp
X-Gm-Gg: Acq92OGopG5MB3Ozda+tCjIF/Bus/laGZ6Eni+u8I/PGyd9rgfGtkBl2NwyrVkK//UE
	qIpgQTcFecvZ6nLCiOi7bbPsapsmOlP+JHxOzKOS+EV5Z7ApuIjdoAKEJpzzXa/8ySSq7mkiNF3
	0PEXSw2grHP2hOKmFS4Gqs6Y2RgE2WRw/1rYEOL1DzPyxquhwsBDeImheqUZ2XrS8ccoikGQIVX
	zFY70bB+LG9IxbWjg+mgC3GphAjoSt5AmORzA+p5+RdcQAJKiEtXZBdaH9fH4liHfPi9F2riKeQ
	zARz7zXEoXQCGb2QLsyEPTtKBrgQDUFcKUMdL4nGqLZjzx+aXhB60yCYDJRSNcYSj6waeIMaSFs
	SyMaRD0S/uja6CQ5STjA7q9bmjjuCsdt+SDymQP8iGUi8oz/Merirp9jDYfpLOfE8RuH3HcUHbj
	h3/ZI=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr136431041cf.8.1779104669376;
        Mon, 18 May 2026 04:44:29 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr136430741cf.8.1779104668920;
        Mon, 18 May 2026 04:44:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm549218366b.43.2026.05.18.04.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:44:28 -0700 (PDT)
Message-ID: <eb04cc0c-f62d-44d1-a78b-ec4fea7891c6@oss.qualcomm.com>
Date: Mon, 18 May 2026 13:44:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518110435.16262-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518110435.16262-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RQ3ToXsBVWrd-XlEULSzQF_a4X87dzgh
X-Proofpoint-ORIG-GUID: RQ3ToXsBVWrd-XlEULSzQF_a4X87dzgh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExMyBTYWx0ZWRfX+xjwHl46ZXuQ
 AiSnWoya4zdHfovsFdXcL4O58eHSTN8J9VLtifPbZY3kaHgiQKNLojTr3PBlevdUrElHWnwnT5T
 gClbGfIFyaNs7IhriBszJlgF9MBBjAfdVm4vO/l5lGtGtsy6u9lyUW/zJqn+n76f+ynPWyCCjXb
 4i3Y3fjvVJxIpuB7GpjozRVyQZhA86AufNV0ppqOEPA8ywn0iOh1MlLP+q865PlL6Vi6MenRCs4
 zK0w6pIMYDSsX+SOnnop6Cxpt1I0EbkzZrHKp9dkRwYAbSz30VyVdXnwjkW6BO9iWazAhAdoquU
 5QXFHc8nDIzrGzIu1VcHEeGNvYfV5gdWLJ8/qqRg2MikfkmpkAuvKz0JdwQjDHDaHEljLmXh8fk
 UlgGbVQSoGJxgf9VjeNnm67d2BTJrGUczyvOBnqO43U775+Rp3IRLWBkNkWN92MKOgZq71GuPtG
 4Q+YaC+f3yXVGTcVVIQ==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0afb9e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=8Y9wC8B1MoRLc4_sRv8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180113

On 5/18/26 1:04 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe,
> support along with regulators.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

Hello, this looks good overall, I have a couple comments below

[...]

> +	vcc_3v3: regulator-vcc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		vin-supply = <&vcc_5v0>;
> +
> +		gpio = <&tlmm 113 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc_3v3_en>;

nit: Please put 

property-n
property-names

in this order, consistently

[...]

> +&usb_2 {
> +	dr_mode = "host";
> +	status = "okay";

Let's also keep a \n before the 'status' property, file-wide

> +};
> +
> +&eud {
> +	status = "disabled";
> +};

It's already disabled in kodiak.dtsi, you can drop this override

> +
> +&usb_2_hsphy {

Please sort the top-level &label references alphabetically

[...]

> +&ice {
> +	status = "disabled";

It should be working fine, any reason?

[...]

> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <900000>;
> +
> +	status = "okay";
> +
> +	/delete-property/ qcom,ice;

similarly here

[...]

> +&pcie0 {
> +	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";

Is there anything interesting connected to these buses?

Konrad
