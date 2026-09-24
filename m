Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2170A400E0A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233780; cv=none; b=PgYW6/C1K5oTMIFatLD4kkZ5+C09oIfJi3AVm6enWOGY1FGkkM67FWNQXPnHIafchlra1zQZu6l+OH/gvL7vnMuaBcIQpd7ASTQm7PlY0Bedx1S9ytcxgSYZfjPMPUDpN5t1ziNPSR2svv/9TEHxbdge7QW16NljKU6kiPm2RUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233780; c=relaxed/simple;
	bh=9B2krtCY+MxnHsDNals5eAEcJxuwJx2cjjHmlvlv5Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7DAEQq1OAiHd5UgwvLJ3mBfvdXh06tgW4PI9LX9byAbaiT4ap91hxElsIcUGq2OHnhBtdcaFhoOXybLzS/4xEogxtSG9EDGnjAEiVv+7kuFXTLSP1krDLsGrBPTs6Rv0coSWPVkoODHVG07E9v/XLGv0k0EFR9BRGVNo1fuxys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4pbpWjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx4S99RS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4pbpWjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx4S99RS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eAop2277186
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQIhQXP7ObT82EVVw2F0DwRt
	jw2CrGVeAmf9ccNKQ5w=; b=j4pbpWjcVTM7h0IdZjwqCkUwN9hul/WbjLUQyaG5
	RrEoObGA4t2uWizjAInxcdTCVG7TIJr2gm+N/KSe2XqIqUVwfjFxbFcfVk1vRwAD
	sdt0CnWAumwr1mmc2JeJsE8qmAOkOUKNusNp5e31LjgLlbwZyxvZNTeK2i8YnQmf
	vOnoNW78CfdeH7fGk2pXd7GrzNvF9u5OVgb0/hFt4OR6eEQIkWZDKPeBye1grpUA
	Z35HqeIMIPnWRl7RUzk2TohRa5rlDI8fPQ2uvo/oCXzYzT3m2hfWTaABsr4xKSTN
	W4WYc86qT5hTT0zCV6khzVVGm0LfkKYO2CweSLLgtYhqTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxuts4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:09:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so2814076eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790233773; x=1790838573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQIhQXP7ObT82EVVw2F0DwRtjw2CrGVeAmf9ccNKQ5w=;
        b=Vx4S99RSHgJHr0uRAxOHXMp3DA9nkAFAPICfKVBrkkS2DSeNfwYprTyPeDxKEZeCNy
         cWEttz8a+XRy8Eaw2s+CmS89bcw9cWl85t+MyGIsUMzAECRyQaoIeyk6SYVMewbClUUu
         hXJYeX04mI9YuN5wlKCN0RfHhDUvk6VLA046zRqwkJ3ta4IFlrcDBCxlYgV2+gplUmux
         WhvbiUZYo48sFQe21piVl6kqBpptitit+quIc5gZUseblMaPRqgwja+VIUo9wd+F08ru
         If3mV8i36fZ52Q+D8P3odHvVSW+kjeBeYDvLZK2sJeofnJc5uPnGOSr17oxDgRyr7SGM
         n8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233773; x=1790838573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQIhQXP7ObT82EVVw2F0DwRtjw2CrGVeAmf9ccNKQ5w=;
        b=BVIF3wUx3FmLnvux0sCpmuewbv32Tzh5rH9JDvgsNVZPppxrgj5rTuO6l54SW1IqZZ
         7GYGO4ZfDqOlRJU4B79vrWeamFfV9QFviMbcYvV2QMd0jCVMdqes4NDXhMf+pG4iVFWO
         2NwhefYvtxo5O/Vt20JoV/qCl6PvJpB0sRvCTsPo2igGH5MAS3Sty7b6LYA+j9YHxEEK
         yA+YJNdsfiZDMQ+ef1znXGkGRCKyRfcS2vX9X/mXnJvgHzW9c12dtNkfepTQ2J7W8tZY
         4BL12aln9+fyjvGMmJwHobR3EYyhhIi9VfJf9MRlljbAfIdnT+3Ljf5my1n9M3J+K42q
         6wrA==
X-Forwarded-Encrypted: i=1; AKwUvBzFYH/st4lMw8f3VfX4HoK1Yzlpj/8J9trqWrn9qghLRQrWmwwLPZMkvV1GbvzndM782yccXLXVvcvl@vger.kernel.org
X-Gm-Message-State: AFuF++mj8ZHQn7gykpAAeE8kVk0VOu05BhLPhYILA9VUTSAVuPpZqp7l
	c1B5bVF5dJpVQwcjYXa/8hvhx0l0qQNxnROhmaW2TzDhetgP8xNvTMfbClRv3GumaYq1Rm7k66L
	G2h5VTz6BXgheNUG2iDULJSiGPTF0NYFcwavGentscc/gBYCMRxvWiB1lm1QoySSU
X-Gm-Gg: AYBFou1k/OvFXlv0k6Q/dWzQECUCkHzyCn8WTxOqpQZfJt4uAeno/qa8Gem+DO6Mpmi
	gBWwLGgHIeA8O5qz6HvWKgtrL4xkdCd3NGmKMhNBo2YCNPfDpDkG1Yt9VWRojHc8raMbVmwQ5UD
	8qpKKVUaQ/DyMNBG3q09q5nkJK0cV4LnWsMjmpqLYokcptCsgUoh8A0mOQDQrDDJ5bFUsISFEjP
	DHXx673NRzduX0BP3qvUNH0wK/kgDU5l4E35dCXBOG4c25nJMXypABSdG0Eaokwbv0kSOpe0X18
	sysaQU8yiqPED7M3fDxZNX2dVS0VAXRfPUkVXZDqkfBWxV5+RBOR/d/yQmjuo2Euu3pr0PLDdCn
	nCTImC0RDfRuijq9WRvEp2q9Lco/5DIVI0F6HEX2JrQ==
X-Received: by 2002:a05:7301:618c:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-340062720f6mr1228280eec.20.1790233772654;
        Thu, 24 Sep 2026 00:09:32 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-340062720f6mr1228257eec.20.1790233772034;
        Thu, 24 Sep 2026 00:09:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96952605sm11525410eec.22.2026.09.24.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:09:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:09:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Message-ID: <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
 <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: h1nEF3n6c2YHtSZ_aPPlKAdhfq7id7sw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfX73axZ941wo08
 brZ3SuRC3m7gZlrWJyQjb4mguR5uXDSeihh+lOUm57jkzp/ZPK24YY/Mb5Vhz1AYLHOlfkp6j8Y
 n8ehlkb8AFYrxVq4+9InJtnPpYLikQ/FruMgAzG8pvbORIn0ltovqT1gwTPnJW6iEzUI1WX/kPO
 3c1wPOj3UVIhc1MYOkww4Jp0veWzH6S9NoTLljwKfnHUb73Oaa3hTKy/EjHmoXsuUfEAAvVVP7U
 OrDfZHILmt0CuIXgzBqsuaTcYo4T/JHYYLbR9+MefMeL6kuMFw+E4xZSlv970YqA1LK26urQ4MP
 2dWxt+BjawHQTj1uRjmsnfEHFrmzv81APezgPEoGtuFtHhrBxJdDTxml7M5Z2zlJYu/5ahY+Omb
 ohVOXNm2Th/ikpwlVFsKgFg4VveALCyqqshLz9GbLWsRj4pL0xB6KnLqveagWizTH2E29vueS2E
 8BggkWP9mucKM7h52bQ==
X-Proofpoint-GUID: h1nEF3n6c2YHtSZ_aPPlKAdhfq7id7sw
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4ccad cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=jaWJLzSDDGsGEjwdg8sA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfX2Ch7TVNsogoW
 Q9oU71s6fLmX3muIfoM/PuXcyiiSetYrBLTyvFd7wqBRT3K5neOV1byhnNAI3HjgBPF9KiGhuGW
 bkvVvYtsd7tKb38i0B4mYu+LtP0y+II=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240030

On Thu, Sep 24, 2026 at 11:52:52AM +0530, Vishnu Reddy wrote:
> 
> On 9/23/2026 7:17 PM, Shawn Guo wrote:
> > On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
> >> The nord platform integrates the Qualcomm iris video codec hardware,
> >> which is compatible with the glymur based iris implementation.
> >>
> >> This series reuses the glymur DT schema to accommodate nord iris
> >> support and adds the required iris device tree node to the relevant
> >> nord device tree.
> > [...]
> >
> >> Vishnu Reddy (4):
> >>       dt-bindings: media: qcom,nord-iris: Add nord video codec
> > The binding should go through media subsystem. That said, this series
> > should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
> > patches.
> 
> Are you recommending splitting this into two separate series, one containing
> the codec binding patch and another containing the three DTS patches?
> 
> I can certainly do that, but could you elaborate on the reason for preferring
> that approach? I'm trying to understand whether this is due to the expected
> routing through different trees/maintainers or if there is another consideration.

The routing is one reason. The other one is that the split will make it
easier for us to build Qualcomm Linux topic branches by pulling patch
series from list using b4.

Shawn
