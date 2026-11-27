Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776991;
	b=03KxtHe5cFgoVwWQYXv2dj57hZHZH33aVnEOURomffgucHsamHRQ4KIajHYp3QxBSle4
	 spJEac29I+Z4tZvMdgSRmw4xS5/FpMbF366lFYK/+TYxT/pprrDNpD25lK6FdwiQcZjHr
	 miXtzXX0HbLsRbe2Kwb92bBbK+L7nnPBgQlh9yAxoR5UDZ4pchDBFxmU3q37OjJCMb5D9
	 b3Z8BxsLCFXDLrwtOFhW28daUHL4I6iEqFk3dh0Kp+7lRIKFQBPpkppQBbU+oVm2eUVAT
	 TZs15MPbKtipCb1l4sMXedomiBje1jynTFA7e2hpHdC2c2/0pbfJx/suGTp7YtuHIIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
	b=EHGSba0QcLzbBQubLNuylNdobhjD+nnRsVD+cZv6YbK+8QZInBv4gYwvGDrtmqtBtS3p
	 bwYUGIK9mGHiAniG1VNhkUKAXAek55sBo4p8q/xlppZ40Xi0XZS0WRwyoP6+gHcCjZAo1
	 fB1ptN1D1iu3wN8hHyt2bUeds2EFcTq9mSQ3BxF/dSPB+GUKT6UOdgqKG655/VNjwOKd2
	 WrP0HnNze1FHQx4c7ykf4/k1zY0ZjaiPSFGrqQT5ljQcGeQUZ2IjkEPwp6muJ0aTombHf
	 Ejgobyam3PhEEmPojN3KLfOITy8ZQDcf+gPSJGRI3Kj8d7il8c1p+XXxWXuW43fmHmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455E606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8455E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApVs41685549
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=; b=nxFWYs+hbj2oVrEG
	DjiO7+devEYg6Y0GUa8g9P6GUlJuqEV8JitG8WUQyqYsqp7C5DeQwg+YP8qUqPFg
	m8a5+VsIKUocm9xrF5cm9e1qXJAAGsmQC4NagCy0lnktbaDj70C0fuA2QpafWxtN
	j8wKbujzCjI9YcHtt2gvvoSGJmcdeASMXqCMRLzFng79Ekq1iD+wx72Ar6LTu0Yv
	S7oskl2VOIyqiY0BBl+sRAisP1RjEJxBTiyL9xIP0j1qAuFrO5pJYlha0H64khs8
	3N9CaSHL5wjXwbO4lPLxwlXYvyGr5ENMcaMctq4rxQn2Y3/cRIjXjpaZhD0f1z6u
	noZXFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8wpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949664eec1fso96533685a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795776989; x=1796381789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=fwd8xnlgMkfHaudynmDKzSndgVVYISR0kXA5SjCRodZrpSPJ+1ukeSEP942bGUHdSZ
         h2qjKRAV05rFyY9j0+hCwOGfddnPfRMaEbBSM8RXq+YwS68hS01vE23gtqFlmroO7+pa
         6RKWl+6chVWG4hXeAmCWh9lomTJ1mm3ZYcmFOI+d3/xsreUUamUtrFrAveDvD8XTLKST
         8VNfEx7s//OA8uMG7ZuZsJwAb6eVObcIDa2jfATeHTJKOLfmeklQAorjfNWQAVbQ8NvJ
         QMIv+GLNudGyXRPNE1x78xEI09tWVG13qXOQTeiXtP1C0wLgt9H7w+Gkor6r+eXBHNE7
         sI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776989; x=1796381789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=K/csBIdgg/ytiZDHyV3pPfyVg/zVGUnPgQ4VMjarJGU3u54h5n4j841ZDZY1kSHKHr
         DkjvzQ3HbE1xepSFtkHzyKMxIgWiO+jMVOkjHMN9lgUKqp4FzlQrFTOZ2BbmDn4WfCla
         r2lNFKOZw0FK6sAe6u096B4fLBrCZ6fEmVuldTRthCmm/LePym4ALtC0IhH5QCZR3r/g
         rL3SLGfOml0tj6wB6pexeUx2PyzzSrL53tp4ZWLSWkj4Sq0oheXsrlzQFT5nJH+ZrYvL
         X+ww1PhUjtb41zL2ZGrehePq8dbp7txuuRzSaW/8QqdQh+CndbZYozmsk637xYqLQ1qo
         VunA==
X-Forwarded-Encrypted: i=1; AL+hErG1bpxcPTdnD4UVf8I0A1oAG9ZPT3iPMpGAioftdybCaMAUC9xbE2K9cZMJ8QLOk3Ch7l3utgP+xksw@vger.kernel.org
X-Gm-Message-State: APuU4Z8X5TYP6ZVW9neVly8e7jrYJTiTwfAO/sOYk5DVTh+ND2J/f+j9
	bdoLhZHm4jVauYiDlTAPXDAlGdYOltvGiO/3A6Vi+gOZlCGnCH5MNk7R6kMMpruUfyyPCPXz/6I
	iS3mB55yBs+6SqsItwT7vJvfcXST3O9+/PHqfE2aj4+xf/cC0mPFzxP422PZKjggC
X-Gm-Gg: AZFdTZeDPM8z7JkmzLDhiSNEEq1mmDQB6Pre7G3Tqnxc4W195Uj3tZIUMHtWe+2xrfH
	9zcRrWmrwCh9UbLwzMEsuMnk/3hJaBqYk4bZ4OHX3C9Cs3rK20LJQ4MtdCCFvRD0K4/53ZgtSbn
	fgXZyuf79XQvXFdzpdcO1UlYpdJdvOe3DQMr2WsEH/MWhEUQk4x71vo+Pr5MJ89gRr76mFNRRdc
	rr/eCuMh8Q27hb2Lxfd4NHo72DNb7FzBhk9FzLu1hS9pTRWgiql/nlQkqAVrS9Twt5QDBLY8Qr+
	3HMcDVluLRfzaTlwAxQ0hfBODrFQfGIoaRgVN2TulAMKygxf0UDcsadunD/QS9tbIz3EJ61+egm
	jjKIZMOL9PCiCCZtEDn6tlVW7sIQjJhd7URUdVbWbfn3KJVft7gCGgZm/X/WREyAvwI2dyvI=
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69443085a.3.1795776988630;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69439085a.3.1795776988148;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb07844211sm4492470a12.6.2026.11.27.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:27 -0800 (PST)
Message-ID: <92f6d14f-1f81-4605-806d-57c13e30126d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:56:25 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
 <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX26d13qSATCG/
 AIkFoFg5CzHEti8SmtNC/TccRcaaR/bhZrB6JDpaYJz/XyIcyoHP4FO0Bcpg6JI9xkTmNP05Pj/
 IXOnUwOb4p78RxeczoKMm/NltazipaT1ykRSYIUSHdHpV8+A56Bxiw9oV7UHQG+ZBabv5okyZ0C
 5SsRX3zLMH2Nc4BU3E/ZehA9pLOmgv+4ReyQLfc00rBrIImZfbACUw66Q33+swNPQm6ugcYgLTE
 OMbb3jco3SF9JUJRKvy3+EfxgeW/0Sq/ITr3qKbsYBjhxBDDv4fRCl4RWK+UDchfS3aCb2E4t5u
 TkRpavx4Gv1hMvJJkiRkHkci63/arAK2Xcfiz1QXm3Qg9zYdA1VwJX5+ETf3ARJiM5nI1njTzof
 +t8e003Q0zFx+qq944t1QhT/igixyZj6yL2VS7f7MyZqpLzoXCeDHzJMSR6OmCdfIvgNLETcg4K
 +Lbv/89RpUhshRtgUJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfXzSfM62ZZBdEy
 kzTZIZlIMpZMqKQ66PSvHCPRR0whYogEuZBsqiSJse0jlYkkT+VAQE+dbjzb4nhERmlSguvYfcW
 +mhSuAGk7pq/7YV6KrYm+Z9r3rB0HYc=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b0961dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3aXJPGk6cDIRbk3RZP8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xN5HvB4NTJhQfUYOuuxj8PSLXseId84D
X-Proofpoint-ORIG-GUID: xN5HvB4NTJhQfUYOuuxj8PSLXseId84D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270043

On 11/24/26 7:44 AM, Deepa Guthyappa Madivalara wrote:
> Add the iris video codec device node for the mahua SoC, overrriding the
> fields clocks, power-domains, resets and opp-table reflecting single core.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---

The glymur series is not yet merged and can't be because of
dependencies, so this patch can't be applied either

>  arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -150,6 +150,73 @@ &hsc_noc {
>  	compatible = "qcom,mahua-hscnoc";
>  };
>  
> +&iris {
> +	compatible = "qcom,mahua-iris";
> +	status = "okay";

This is stray



> +
> +	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
> +	clock-names = "core_iface", "core", "vcodec0_core",
> +		      "vcodec0_iface", "core_freerun",
> +		      "vcodec0_core_freerun";

Please match the style in the glymur submission

Konrad
> +
> +	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +			<&videocc VIDEO_CC_MVS0_GDSC>,
> +			<&rpmhpd RPMHPD_MXC>,
> +			<&rpmhpd RPMHPD_MMCX>;
> +	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
> +
> +	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
> +	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
> +
> +	iris_opp_table: opp-table {

You need to delete-node on the Glymur table, otherwise this shadows over
that one

Konrad
