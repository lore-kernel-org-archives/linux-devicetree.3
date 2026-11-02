Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639360;
	b=14Kzt9f/irkv0KyaDHfX3KTxjPCvmj/HoQZvBy5V/X7mx4DtcM4oMAJcp7haDonLGooa
	 8JWSXL4RrYprMzfRUxxwKMJXdTOaYYGzOSFmaT7blZt0PKDiRoMYvHSTtssNZE46kMOw2
	 VZ8o3++JHkO5Fw9bK0evIlvzcZy3grRvWjvN6gPUnX8pUtXhDea5XpwLEqzTrQkF4eY8c
	 FJCZ9RlGetbUI9GeOu3noLpPEKIeGATGH1JQPrdecBDG+T2+jjY/N/+ZWTuUMivudASzv
	 NwW/8kxj+vRkpipHMP7bFSdRi0qvbdVQTEiTdkf3zl/dOx6xfxPSgBW2Wn9dmvI8NNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
	b=llZELiRC91xmeLCXZvmj5S9djLEvLuUHwC3dvtl8LWYjYqN+OWu/sqYZ1AR2x6bBwNVR
	 HEkcm+cQi4WuaEtjZGe8O0VejLCPeFrWCDLA74N3b31Sp9/ImhqhWpQIsDLdtb06cgk+e
	 t0foFrEUGwFqTMI/OwLRDIfqk35PTEwgNb0x1xo7v4GfmeEbi2OTVL6g0A7EsCI9LD2bs
	 ZtAdKLGsAlCp/Z0vpXrxhL4I5tmYYVD9yeE0txMiCKLRhR97PtjW8jb6UhIPOMUUoapwZ
	 94ZGkF10cenV4F5PEw8jtHOsDgg8/sZ4u93C7dCKz0qQfmDxHdeIvB6GCXdHwTCsn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClalfCpV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkeyjU8z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9060716D2
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D9060716D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClalfCpV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkeyjU8z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZHhH856684
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 17:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=; b=ClalfCpVKYgZwLpG
	o4M35d5UPvOB5NX3PCW+UtWCe/zCbiDgH2TXEs454m/ZgbYkfA2wN5QKBrMmwhwp
	mW+8EFAvJ1QYqYQPZux5vIuc721PJFh5wWqUOAGFhiqI/T8N4LFG3MKtT7LFjFCd
	3EDEi0Hn8mVC9sZ+OnlZj4GD/eJGFenVIGeomtnUNt8G/dKREKU3nEVoAcS1NUS3
	U8PMouMLQlhGA9FU8XdmrIju7alWNd1a7Y/ZQcVXQd11BTcuff0EN8SgCDh55Rbu
	8z4Rkjyx7U7UMEpUYKcwf2UDODeyyzSpiZNxEhXj4yFunj29HlC5NDz2SxcLrNMk
	jrlTVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph1ab77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 17:09:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so3185658a91.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793639356; x=1794244156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
        b=XkeyjU8zw5vb3LRIH5CoQoTEUZwAtCQE23Ian2FZjZf3jIIZF6TkUg5bG3NZ4OOVYX
         U5UbmuzwBz+jYj9NKGt0WN+uCgjsYLl6X6vbpfNi5b0oNR54ziPnegaNGTmbPX76sOAh
         Ook5snab4oqXo2nuwayn/ht4HAbJ7+GaCWAVCBYEkn2gL60msMd5ld4ePGLq0fQwR9AZ
         o1DcF2mDc6zQs+tSzfl3m5Iph8MTxHfEOCjv88nJXzxkEjKciD8/m96/O9z8mVItC/xI
         Z5mSs6ctD7HinJ6iVSWXmHfGba+tHb6TVmGuS/KpIPAg1NgdQ8vGbGwUUcWKjGzAqg0d
         MOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639356; x=1794244156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
        b=U8uh9GCYO42Ql95BdcaSCv9LAaKuXXvP4pjKu7FxBL9EiM5G7/RnyUtVW5FEuY+pDw
         epVi0p7nu2gzGQczY96NOlbRN7T2jHv79FXccqDnkeKQcl0UD1cq6UB5m+HIaHnje76o
         5piaErDFaSINjZy9GQxCGeopODSKnV2GrpokCTMrIWwOwKo9z683leZf+/IJV9QW9rvm
         HkNbQwDmmV5zNqhWyS+FbevjU9Bm4dJBdNzuzFeHH/yXvJUSn4+rWr9LgUik1Ik27ew9
         cmDVWEUHxQC//l9NqFpsB0FHwXoXzZjXgMtgIqqPTv2jnQ6M+tZgfpTpaVn8udMcQw9J
         vh/A==
X-Forwarded-Encrypted: i=1; AKwUvBws807sip5sCnWACTsfJcUYVJvGC3n+KUZenkgIBD5AeAlIw6ficIStu4o5HyqlqoAfDbrpn8gwPDDM@vger.kernel.org
X-Gm-Message-State: APuU4Z9sunPunQjjVA1RHPk/xlNt0EOCeluAdboPJHSSvwm9/qJc/Xne
	EbgEywn3gHNxyfx8Dm7dby1e6iFxtXcMi7DI1ybW5OOpUqusOxKxT/jnmkJIXvpLwLNclOGsPwe
	9aCd0e3XTDQ79GffduiDPHtvvHDkQX9+Nw7qk7tJaYNAcgVodOPRsKLX2/o0QIx7S
X-Gm-Gg: AYBFou0B8afMFVtW6NhsEY2Ken9x3gIje6P9w9DiPHABNvbNvx7MbCMrMRgScdj55ad
	HUnTnTZQRTQXQ4HyNkP+1ubUj8FjlVFwe6joWFwKJjzJ4V8b9e0O2MEFxtJnUZEmCxN9ukB3U7G
	s0xuKA6v6NayB+2rQ3Gdoguyx2tmAxBYz1z5gQUAW6fP6pH2O4vR9vGnF4egOROYg9ziC0NjLOt
	x60SiAXZu4w+aANLKVSgk1LLjR7IP9s+fxtAu+w9Hlb6wxzTIHwEzRpKDZ0Q+r14WynV55OsYaY
	3M/EW9Cmy2FcNQ8AcG+ioMPDoV8GO31FaIIOHfJhJcqGAiYLGZc6G7TYoVTv2IuC0PO4mQJDg+i
	oJz7z0XxjZbSVVO2q/VNlYtQBlKmv5+TPZwG9RwwtOILCaG96yO0FTb4JzPZr/MwZJeuwiikGVw
	JOlAPT9Ft5JuwBPC93FColsR6DEvKdrg950g0kxH0=
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr4756785a91.9.1793639356394;
        Mon, 02 Nov 2026 09:09:16 -0800 (PST)
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr4756766a91.9.1793639355846;
        Mon, 02 Nov 2026 09:09:15 -0800 (PST)
Received: from [192.168.1.6] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6c4259sm35635a91.14.2026.11.02.09.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:09:15 -0800 (PST)
Message-ID: <3da347c7-6c7d-477b-afe6-9dbb37208438@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 22:39:07 +0530
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
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _16epI-TN13BshTQommVoNIQA2aOkC4P
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8c3bd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ptdc_f1R2aCmbPsLd1wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: _16epI-TN13BshTQommVoNIQA2aOkC4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfX1uQ0HOAqfi8v
 ydxLHipou54bpYwZYNt6jre7Xk0fZQOK+MmSxKimV99Jtzg1B+o9e2S+8IGYbGONvAj5XFYAFGT
 JCdwYvnb2kZa9jiyeozX2xy0b02PagNvsOx+goRNof2ftBjbRQJsUEaOfeS+Jqy76O9I26ofmcC
 pLOiMkuFKKrAAXM4K5mP4qinctMs/vcs1bz7dphn0pqjhWnTWGMO5ujyHXW/YbyTAWaPp6cJ2mU
 IsoboUSSSe7CoAYsRS/N7+O9ezMUF9GnbOm26qLgmcQzulI+M9x+P2+UPVFe2pgCWvJZk7j3EBU
 iAV9VSp8hGHI2ziJWJQZspTAlHqcbkwFs0Oqp9IDTBiM+ZIlXmn7z8qTscI5zFGo469f03PED8g
 gl1kg8xMuC45P95ytGNbntFw2hUP1HS5xBXEAlMcE03CWSk6zfSNkDjywz4S+Fdse7nWezb4XUd
 x6lKJHEDa8TTz2brW0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfX3jrzZFNx15sM
 7rE5uUZ1LrsWSf+uHwbfnA2qSqovpRRM42NorPzXUFW9k3HWV7zd9cp9y8xZJnxqg+kVsqyisap
 lIJTo8V/EtmQP11mSwcyrIIb9chX0jY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020068



On 10/19/2026 7:45 AM, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
> 
>    echo on > /sys/bus/usb/devices/1-1/power/control
> 
> PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
> "port_wait_reset: err = -16".
> 
> Set snps,resume-hs-terminations on all Glymur USB controllers. This
> makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

This also fixes one more issue in Glymur wherein the HS Pendrive 
disconnects after exiting pm suspend.

Tested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269ae6e10ea..023a8448449c 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -5544,6 +5544,7 @@ usb_0: usb@a600000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5620,6 +5621,7 @@ usb_1: usb@a800000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5696,6 +5698,7 @@ usb_2: usb@a000000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5783,6 +5786,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			maximum-speed = "high-speed";
>   
> @@ -5858,6 +5862,7 @@ usb_mp: usb@a400000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			dr_mode = "host";
>   			wakeup-source;

