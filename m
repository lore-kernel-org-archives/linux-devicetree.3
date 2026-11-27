Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779365;
	b=KZc8V1YKBsyXJOGvWzQ4hYxJnmmpz0g+s57Otc7c9VtaODrj0Awo7LvQX9F8Ypz8eyYE
	 8G0dmQDxv4yWE2kRSdMqoPoHiPCauwvUu6Es88vxGAYbeGS5CGGXCLYZwsiceoKhO5epc
	 Da3npBgnYoGiV57pPhNT6zMktlYtV8dDTpb0N5+NCEhiqms4dzBmhmJi8usbrVw/FJwD9
	 f+at1K4f4sC+b3zMu/NaHyVd33TiWs5iCa9N7C/Jf0ah7FSV1D15oAJ0ZgzF0bNEuV8o3
	 iTzTFn4mtu7u+eZps/HfYfmu//rOWuRWd8AEaCoMnSZcOWew7gf4j5T6yQA3w3yntZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=;
	b=jFcq+9NcM9K3rIBK+k2fEJp+Xjci5HhKaEw17in7R0JjHBjgZS3YqYJmPovjK2qw8DuQ
	 zO/9eKLzCq0tRJGXR5mS1j5INiwoqqSrUHZV4VaO5J4UJ5RPjxT6SPRMy/mldleUTx6R2
	 58PmUg+jyEuNzsGF/Vdrd36ToVCFXodn9LMS7SViFcpwTlooCIcui50qnD8DvAGz448jU
	 7InPrc5JnXpHeLFQRjiw2D/fUvXjttngFFegbPEXwwB/5lVf7jjQcjK2E9UxTSkJmhoXq
	 azCdTJWiu8Qw+JyoXyBQgVGq/KzJ+mzi4yiwPBRB9Lo4r3KyX/uvgQiOrmMTHSfpu1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoRTJGR+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUS9mG6y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1929606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1929606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoRTJGR+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUS9mG6y
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAoxcg1961768
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=; b=RoRTJGR+DRImvJ7H
	GnUu9U9almkAfBFx1Nxub+HHDBej3r8QD3Ad3ogl78ACHGQPjJQPlQiHV6DRQEAO
	FiuLvdst/lswoZ5cmu19ojsoO5FzyZYc/nUvyQy+yjKIbY0v3+CGXf7kXfF//Awh
	tZHwmIj3bzLMg/mEYOZYd5zerfDO26nIKw815tkNdTNYXgjsBoPw99UTZ757QaJu
	PtBPfz6l9/HkJZhGu6iQNq9j0CyiU5GJq3B0V8Z+fBCcjO5foB0maS16QlrqN/3B
	nLNXba0tex7bhplpE0buyM4HbxlcsoXuRsXce5TehP55GaJrq86O/ppcRzfOjA/W
	8ZN/SA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4httt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:36:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53657d237ddso11284631cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779363; x=1796384163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=;
        b=MUS9mG6y5el6PFbdEmbDFqHNc5RuiXLVDlcf7fWsSptSvRUkXgtK/03qf6CV3ZUcwy
         LG+WehhlnD4V7DvRF7efFpTeUezQDRcNsO66ztIBLgoM/qUtnKz3eYPQ8PfH0CX27fI1
         TYNJV6/V0SLGOuZSB2g7DYm4Y+JOXnUlG8JVEWVRZakkHdtvsz+wN1SkIlJJtMpBvu0F
         mFOUw3FEebE8LhZ7XRWjVmIXych0LB7XsYfAQb5ctESz5i8hxVuZ/ud5Qe0pRZwOtoPg
         ue/rgT/yu+zCoA+INO90AO0Rc50Sy/XKhznT8F6tKFWqVlWrSftqLquXxbNfvOlnJjNi
         eckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779363; x=1796384163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=;
        b=ZrFI0ihQIFBEq0v5YQppjt36HD+oUH7nKDulFTAbK+fSNX5qUlSeNbmKOB3FHS4RmU
         14jJXvU9w1ahujM2Qp564/kfIQUmXXLELRLUUTA2T7saoXepg/z7iqRey/Tcv1rDNl98
         zNlZ/YW35eW1YJ1Yv+sRNy32lo/Kir1KYVkxGMLW8HiwYFSfMfro9OCZCIg6A8ehtnO7
         C1azdhInz7ioi/sRzaOGKUyODhe5JCK28zbHKzIlJ+QEBeYWF/35qOXb//q3cmd4hKlL
         fdI3jzbxhZuwKRHIm8SC7uFQ6utOVlJVQ06lklTDHLh3wVNlhLYqiqE2G0GSBIJ3qVV8
         aR5w==
X-Forwarded-Encrypted: i=1; AL+hErG+jtHA1/sUbhT3vCrWO/qDd1HJsLXHll9oqoJUm6TCYq1RSzhqln6FlvZnqu3G3IU7B2WkFXi3vYdE@vger.kernel.org
X-Gm-Message-State: APuU4Z81U4RPN2oqsPVGT2+qL8f1eliPIXDxqC5AvVB4tiS7ekdjVfXj
	S7Zwdb2qzIhP/zYq1bgRc7GqR0ldo0dbd9JWr2EoRPFFFJR/0U38UuThznvUn+fiyvcgHBfFHEB
	X5e3kLBXneZ34jL2iD7+ReAl27pVaUVlAlWFINDxEmQnfRlmhXU1M86soyPvQ7u0+
X-Gm-Gg: AZFdTZeN9EWOoIRcLM+5aJRWXLSQJYrSP9Xoc6dL/eJM0M5H5HSarZ9XJDfaJhMbtRw
	4x3CdmkLKQlcplGvha5QNSEJFM2S7wZH1D1vdPHO37porFnzv2d3peXVVdvsxIUEbbozguBqeOD
	Zud9GF+q0EyzI3Zk/LS8zSiPhHBkZeZ9ReoMRqX5ZFK9F55U311nC9cn4r7sVcde/RfrjR37VBz
	JHY7wQ1DIOTge6a+1BJK8+REk9j7X/f0GSdEYO/xkQxhrJOBgZamoz4wcQopDqeKm67JdMO98Yf
	50K0RCbsamDQT0DP1Dmpbu1MOLiSICYi8mVmzGWKNIXSkC+Xi8MBgHNbe3/iNSO2kQx62z1HmNc
	lRo9zxEPfTab/vqY1UrEmY6iL7kAUpY9IU1LMduTOwcr6oKBOtt7pehXMSzTVJKr7iWBhkgA=
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3909060185a.6.1795779363261;
        Fri, 27 Nov 2026 03:36:03 -0800 (PST)
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3909055985a.6.1795779362774;
        Fri, 27 Nov 2026 03:36:02 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm852363266b.45.2026.11.27.03.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:36:02 -0800 (PST)
Message-ID: <4eaf44b6-90ee-4f55-9f78-c2f2f6a530b7@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:36:00 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX3uK5Vu4OKexL
 tiNVmrZ7qM+4uYqJJaGLF2QICrUxMZ58cNslYDNOQ9P7TSRPfjgFR0OBneEZJi+pm74VF3GU3rc
 +X7vTvKBNLuLR+JTHEgulsRPqtWFaLU=
X-Proofpoint-GUID: I98cO3GuoZ91uT6IWaaZtCOe1Fgu-O3U
X-Proofpoint-ORIG-GUID: I98cO3GuoZ91uT6IWaaZtCOe1Fgu-O3U
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b096b24 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=G2hE9K5e46DFt30MATkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX1r7TuZ8vWHlD
 nIXD8elQJWwnigHXrZi2sX3u8Kitui1mlab/0rU1uo1gZNMHa9W/ra7McM89XcgIkaRWpcBEz/R
 QovHIHKg0okYVIgqSNpHh1kNSPhfSmpWvJp//FZtk/WB5kKX15xBAmUI6dlc0qJ+PfSg3TGfsrv
 gpTTZ+YOxxPSSYz9ABHJRE8b4XJLVQSXCXwlBEfAyFGDHcpRfIFH3PBtjBXSFi2sjQe6IJGQixG
 G6YWSH4vkWEc7ygwXI+Euz9xlRIc/ETZi8LyOiFNIsQdN69Urs4Ri54XO5eHLMPzh1MxChCiQbE
 QSwK/A/YEog0RuLVO7e84Be1BimjOonf0+/6Z8flBMbLnPSM4bTli8LFNN2B86dLXDLGxdqxLjm
 wbrRXpXKpBsQabEVMoTVBS6ejM7SYrIvWKUU05eScJ9fU/VJhsWXk9dThUJ/4VFC7r8CpeiwLrd
 kpOjzViwNtFMXC9UhiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

On 11/27/26 12:33 PM, Zhangfei Gao wrote:
> Nord exposes System RAM in the upper DDR window starting at
> 0x8800000000, beyond the current 36-bit bus range. DMA mappings for
> pages in this window are therefore treated as unreachable and may fall
> back to SWIOTLB.
> 
> Widen ranges and dma-ranges to 40 bits so capable devices can address
> the complete DDR map. Devices with narrower address limits must
> constrain their DMA masks individually.
> 
> Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
