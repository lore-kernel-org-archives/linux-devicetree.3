Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518A4446F3
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317685; cv=none; b=avn642uVhuTRUljB+pZdagd2jvZ9+kFDMyRzYt0aAhBXCKpAdDhgbxBORSni/wmubcANZkytW2KM4ktaujx4/HmBj+dxxzOnrlAePeqCqZ0sxhpMjxlpDLqrtJrmnKEWWCqCyCVWRMZdIjP60PjRDiLoY+K/idnsQrcmC/OSFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317685; c=relaxed/simple;
	bh=I7b0+mQh5Y1NLP6boh3uPH3gnqJo4nHqUZGG8D39fqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqNt4Ni679WLpsWId0Er4esvcd8zgSWeOPPE4rHleW6p0YZL6J/4MrKjBwebMR8xyoQAfbnLydPkUwOfTRwaVPtiQQTkEPnkp1d0OAidDVuwRB4AIF26NWyVswQnYXqAAho2d1cYqN3aad5hrzr5pyuTH5K3Xgk4CwLRTZqAU/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTePneXa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9fMTj9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTePneXa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9fMTj9e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f15n944400
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVeMz0N4P/OSNyV10j6hgoTEu90ATIPsjLh+4S8fcYA=; b=BTePneXaiS+YvXm5
	op0hnWJXmn7+bjr3R8F+hPFCrQKBh4boeHpz1HmlVMxHc7V58oskoEbazGTQOQp6
	WnCgvWGymjK1I/GqWW1Y2+bqBUrbFtG/ANWVFpr7XrQq8a8n0J+j5Oi6wOfTAnFf
	KL4f9Jd+tQ19uMBm5HiCbGIZP7ATa99fpy9LCR5BBMxIOM5vP2n8gH2KDfcF2auP
	0/2CNxD2iBNHjbKgHohUmARBEXBgXkGe4SL3348kiQGFdXW8lqPxZFCN64vztctp
	HblYblUD3iVcElJqttveFbP8BLTynbSF246v9RRmE3RCzB2TqiB34EnoR/QlidV+
	CLEsJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm0wnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:34:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so1245261cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317682; x=1785922482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVeMz0N4P/OSNyV10j6hgoTEu90ATIPsjLh+4S8fcYA=;
        b=Z9fMTj9eKbCvHU/uq2apuugXffuXAuKusHECr7e9JR2cTHtzn5xtUI2ieHYldrqOE5
         e2+ka2Sp9fJ9q7IScHGpD5PcjXF2AaHSsNnKPdyMRMKtgMZCcuV2ZpuvRt7drTWYiv1c
         pSlyFZaq6QJjCofjRUMbOFyb4ztOoSKrRcIg1mmR08VUt1zIH2GgS1wSdpx2VU8i1vOl
         PXGrSjHcZTIcrAWsNRTFr0xAh1vFZ43vzdjnNcruAW2nhp93Owcka30yYMux6PTBs+J2
         xXU2UKVKoUKlqklxN434QFCRG97brYiNz5+Jh6K/edT8XSWDXQiEcIJPbZYPxXSYxsWr
         W64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317682; x=1785922482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVeMz0N4P/OSNyV10j6hgoTEu90ATIPsjLh+4S8fcYA=;
        b=njmcDv/u4mOSkGI2isI9XRoopARX+t+ulkz6sDLQVMgL03U2Rvp9EKP7oXWeYqxMgE
         6d62oD/mxii70w7Yg5hNTdPVJNzvAaptfvyL6gZIpLRfi4V/LBw9IFiWfFRSLsJBh8QA
         nuo+FBBSMkhpTT6Qsya7TCS9o7Nh7lNKpirODJFnfsAZUOsTf/vH8nzhZUfVmfKl2qUj
         XDTVUjSSkWvkvProrCPUN0z6XWsmT3R8DrIn+L09KnMMVKBwDYbL1w2/DJLdgc/OKEJQ
         G2Slg9JaIbvAzdo6iR7tgoig/EsGTbNSINWg+4YLyibmjoabTh0MaOJCj2ZAtpVT8p9v
         V2Dw==
X-Forwarded-Encrypted: i=1; AHgh+RomK1BSZaLSuBLwgNGMIYscmLhEUrUmAeRRYQger1b3598QKIv/Yc2jFyDxIQw5//9dE9i/k2DeadEd@vger.kernel.org
X-Gm-Message-State: AOJu0YzpGkaIzw5+aTYa2mZ8wQO83am4Do2Z4CIHXvdxPFeHa2jokTee
	L/9Fl07BeiNlZQqH376gn4d7yrv+zXWh8iykQgevyaPOHKq8tHbWxR96cQUFyaOPgCSBC0p5dBD
	BcPDMx+pngjKFIS890oz19Tr84+2o5tJE5jvrZ+ye2nmsVBU8Qbhy/y/i5505umsZ
X-Gm-Gg: AR+sD12SgnYJ8ptTN7U9CRM/rK7stagyoCONX17YYu30+9mEIW7cTPe+EGvTr0iRvef
	oTbhpsNUuFMcHAXKJOw7AhXAD4Urj5NokffPcoDafrPe4tTJKKNAL2octPkaYprFkfJYjxUtP3f
	dc2MV5l+pn7QTjGJD2pzsclCPlJHWxn6laflRcDJofE7/ZkDp2JXl2tgHn59LFR3/wPswRJedIm
	m+4+xe7QCRXyJ505sL5SFfBnOe+d9DZG7NtoLMdsopv9FAzq6WL26D7b7ug2hbSHFU5zM7YaW2J
	rUdRKHzSujh0jmVjdPXtlzWA9VS0AJa9p9NhNWocVbjVRTw7O4JZC+hJp/3xrH3KSWGcaeMzJ74
	G8ay7UCboptG27yb532IWQdBU
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr36667451cf.3.1785317682600;
        Wed, 29 Jul 2026 02:34:42 -0700 (PDT)
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr36667251cf.3.1785317682258;
        Wed, 29 Jul 2026 02:34:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83c68655sm90013166b.11.2026.07.29.02.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:34:41 -0700 (PDT)
Message-ID: <c1722aec-4464-4aab-9848-987725a6f3e0@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:34:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
 <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Km5nZoPTIg1QTfYxufP4QJh6bmlBq84N
X-Proofpoint-ORIG-GUID: Km5nZoPTIg1QTfYxufP4QJh6bmlBq84N
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a69c933 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QXUQ5p6r880U3D8F7JkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfXwSQE9O6Q2i0c
 H823+ho1ULDR88pGWdqg3r49+FG1amqcV5U1zAQeSbmzlsI6TdOVEibiwtwBzD7RjTCYGUcV7wC
 KsgrgXpUUxwsLMf+r8ypnUlmrF0gp01r9yvwq1PHjoll5bQi4wQ8FX0XUVYQ2hy4FjVptFaQisU
 y3JSobCmU0y+H5bi4GsufinUzz6LXyRWTz4fSr4ETamH7cB8E8igOJjSWb+lqZ+/D3uyrguvymD
 1qsFxJqooXub2jGWIpl9mqpJILg83lhvT/HAYW+ANjhELDbFdSTmee3DxUqp45msiab8U304zqV
 8vgxRNflm2Dv19jdcKvzrF+P1pxPQYcFAF1x3VLPvtdhPRZE6CjprdAqbCPeYrd7vaR4QoQosIf
 raKVpOoUeGIaPhh37gEl0EnBLyDVktilMEO1A7EBlJgsVQV7jsVvS1PGEZOREmIhT8dHIx8PLC7
 HkGtjMzbHjnEGoY51DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfXzkgf3EXP30k8
 ET/3e6jWAFkM1Gcthx0ZrZi6R1jv6PjYIgrO7Rv0oxwX2xKh4xdBbDGxbf79qOdy60irqC/ArKs
 gPNfcKp+NYPkP6RrViyZids3KGLSZg8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290078

On 7/23/26 2:15 PM, Ravi Hothi wrote:
> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
> defined inside the LPASS LPI pin controller node. The hardware is similar
> to the SM8750 platform.
> 
> The WSA macro, VA macro and SoundWire controller are kept disabled so
> board DTS files can selectively enable and configure them.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
