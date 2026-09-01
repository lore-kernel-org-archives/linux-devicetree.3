Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D4A40BCC8
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274163; cv=none; b=ohMiRIcHAdu5zgsOYpJQrgmTE9zN4Wj2qOP52yUFUSkWzF2JU1T2GCdG2++KDoZaCE1oyOnNrloZ9dfGE0N5QX9QKwVI9HRI/n5rCz63nLCNz776dI1tMu63G9TWdI1CNHNWGfN2AxN5bhiLMmB6tDU9SerwicCEak92uvv+GH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274163; c=relaxed/simple;
	bh=h2WLcDOj3k4OBlntnyY17nVK4H30VzUclgqFOJ0yB3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KewHS3c/yeY0EBgKcXA7DEJ7yDx+1E7abmpQEZ9b/29kTKWw2NDZoNFw46AQRVx1Z+0DlrVagYtIOtkBmpC56EdhVnZSuvUbsdjkqQFFk0qj7nFzLcSkqqwVWmYmgZrrdVSIuaaWiHb3lBgsibr+4XhFnLac5NM6YD3GpSX0F8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naX72m5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXsDupJY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naX72m5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXsDupJY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681EAWNI3005869
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UvoY2QdWS/vIBjMfTsuzBB/l
	DG2V9aKuSuLYY3rq/zM=; b=naX72m5PjDY6NXu390ua8GewZqfyb8oRuKwuhyvS
	7T33ireJXp5n404TLry00uVqZkLDItc0zvqbCYIdVIogFSEMIuQINCwJMRhlyYvD
	PEnRslO7aaiV7iJYrPfIKESRl9/HzhVBlRA4EWx63DqBCLFTyEvVobRHfz+dKfuz
	ow24bO59xb9jHao/XR8fspsRN6spIdfa2cGVH6nUuQ6lrDhft90X14M5I8b+ftJb
	owt7YMH0NIrPrNaIKfhekGfan/QdvOk0JwvDXVAXbgOUQ8KKCC18u3EAEWdFYjDd
	s/KZe4WTSw0UTxxEzNAD0/F9G7wxFik9B0xZ6NaAOPOfaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh2nng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:49:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so777861485a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274161; x=1788878961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=LXsDupJYEbF3R0HW54HG1Qxz6yRb5MWk+b0RA4AJE62e9FLfgfUPp9ZABaLotVm8so
         csHAwlp59yNPODs8snpiW1z4oTBrU1N7bMxM/Ur2TQcSik4diVPuxOeTHZgv/Wga2PLZ
         OG+TkYatCFc7W1RD90/GWq2QQyhOB3bCIcM32417lSoS8dNLNLdBhvGd6U1lh8tQHS1M
         IfpPk7p7bwybFjJfhy+2DmJeK+vti4A4f6YHHx7//6gcRvrQ/vz04elD6G8vRcIG9sj3
         wCXy887bZKZ5JjoooLdLnaltExmYMWR2czNgkadpLZ2KtO310oFFAkN6pNjNXX55dG0F
         O+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274161; x=1788878961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=Nhsn52CnN5lomTVkl7jW/WnZCcSD1aX+2BPUge4EndqrSkNR46wftf2pWZ8WCu4p+I
         GXQlAChEG6v+FTxgGUuH4/2azqM9qvl3qxw4CCeev/eabzgMaNgaOw2JM5upwiEUJpXE
         Lh2PUdoXR+pZYL0OK7wY2Bm35QOm39GkSJukEV2nuxLNehlnNRjbY+Hjb109o7eT9Hzq
         6QsliA13WN49i8oPk6lMxhaTq4yPoG/VXzSsgw+J3DVdsnF9sLMPz8Xo/L/Wowj8fOTg
         j35vulWCRinitmVcMYbrujqHppp8n8Uk17WlaWdKcFihSGjRaIYMQb1d5qn6/82U5Jxe
         P0kw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+8XnEhHamtvinQkLUdrb2h1Oyn/59cb4S+N097Th0vspApTVYyOXCTMxDT1ogmiTyj+GU2KA9/768@vger.kernel.org
X-Gm-Message-State: AFuF++k091N514W4RRAgUojw6c1WI1WfUMTl+KYH5T+EbMAzzHP4jDRv
	GUDHLYI+qUSddKHt7NOip82GQKxZvBnZaTbtg909IiFMglW6H6FitSGaBHg1OJvzBpqbkPqOmdj
	UbRr+B+RW9uyoIEEvINNKcWlv+FVt8fV0mXnfYlKF+OgnxRTDMdUMni2O2pA5fdTh
X-Gm-Gg: AR+sD11tYqatOzxTAu8gvFhLv5tRDJdNglYjx6XIK+0ap4/VuqW1p4T6uM2gNHWHK/i
	VFU3TOhxRRSMH4gZlMCaaUGy/tQBuVdkvxL2ZIlR3eZBn4nTrIQRJVV/Ar2/MpEUZXnIi4eRg3D
	LbjYvkU41dnxbbIUDsaDF+6x1d3plGt2jbrpvPeGbKPItzV/NXGjTYYiWXxxJHOF9EDeJFeMbiu
	3XllcILeXjuDUmiFkMfRfvmjRN9KNplTxR55cehP3V7GQS8Ktx8lWzrMtpBSCNR5/+RCtpoLCkB
	NErT9kzjigVj+8Zg6sgJf94xdj9zxTxZ465qPymvSgmJXomyMn2qFNL6l9dyBUOQnyiCmKFJXT3
	QDopXerQ9zToFcKk=
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984657985a.3.1788274160483;
        Tue, 01 Sep 2026 07:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984630285a.3.1788274158525;
        Tue, 01 Sep 2026 07:49:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42593sm5660257f8f.2.2026.09.01.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:49:17 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:49:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
Message-ID: <m4y722wgil3rw3pg55vemschlcpiug7s3zrdkn2gh5fpflp667@eahg6zydkxjd>
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX/dXjMvFh2C2S
 +fXmZikVplHWhkc7R0h0+WnuJVosqXNYQ24L+OaTISkEvUfwjcOmRjmz4mUGsPgBu/Qens1iWCz
 JAIgiClPzhhDAJioVG/3kqrYeTzLUdE=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96e5f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_ajnx2MfLvpOtqwsA24A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: iSRMl72K4PLx4slkAWFpP6tRrZdTix3I
X-Proofpoint-ORIG-GUID: iSRMl72K4PLx4slkAWFpP6tRrZdTix3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX7sOxzjRxG639
 PxlKpwGxp8Qz1+EgKDrzDv3j+Qeyn+rl1auPfSy0tkGAFHzX6Kj+/EG4p1msgL3/GFozRyLHaEf
 nO9f1qZ7HWLqCfbUsb8SokBSI+tT6yhAUvbxlJG9tddF1CYlQB+XA63GVzz4hXqMU7xfjI23uQF
 NueICJVmwPQBu6BcC4po4DngCh0pQ2E+U/O7kCaQuB+/SYAV2n4hHEjWdDApSMw7kG3t2Hn2aBK
 BKxDUtEqaUNTCsZhgHnHRkx8nL9MtyDWaJTYmK0AhsmpYFR+r2ZDb85pRAoEv5PiFG9jY1fxyWC
 YXf5xgH4mBJ4Qz7DryqcooAWBnwWd2Kt0xIKkYKMaYFZJHRr54Xqke7ol9N075WaWF6Cfut1Ldo
 7uDBz2RXX2nlX87C3PRLZn6q1zJ8iawbG/R1aNWHCdsAfgOTAxzYuls0tXipScFvl9sgUn9742Y
 +i1TbpmnFba8CY8nDTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010131

On 26-09-01 11:20:56, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> PM7325's l3 and l5 are supplied by vreg_s2b ("ebi.lvl"), however since
> that regulator is not modelled as regulator, skip the -supply
> properties for those two LDOs.
> 
> And document what the "missing" regulators are used for.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
