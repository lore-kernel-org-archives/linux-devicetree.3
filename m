Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462924;
	b=N4BnT9oLSkbRTfRlcyPuWyWGjA9+z+taUgWDatI7dEAaQadSQG3ry89fA6mk2UGGE1YS
	 6ULUYHLUeH9ruqStOl/EXVX7PIDpH3SnWOeqRewOJg393zxMONtv9JKeTlXi4NGuCP05C
	 yk7g7IwksDNAOwgWfiuChDCcynkf5wrGaCOdgJPj6C0rB4JhZUc8tO/I9Rk5hu8L+F/YD
	 ycJfJ5yOuu41vL4Ron4zSJIlGU/HfYujSpJ8rAzFYjGF4G+XM2N3oHyF6nno6cWL5QaZq
	 aqrAqAI6mpgiDpfzC9x+Awgkwztwk0fAJQpEHkWtcRzGEhRj5pTkWAVX4mutJ+8ekmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
	b=Gw92JzzbaHdKEZbXS24vckCTxgG2nnq7lR2X+cBe+aUR7Rm8EWx9Kn9XjKsE1McS5Vh0
	 5Pc6B+8Ot1JSCMj6Gwg5enxbwM1f9D9QoE68exChKT5tKiZQHi5mw6ElIwDW/rHDFaw0b
	 kd0SXyzob5tUWtuxeRTY+Cg+G3mXDpXlPHdvGoGIL4or+LHurUuxeu9dM2AeXDz6G8P3C
	 j0F2Aw/5KOWfombAD3AC9n2EaJge7CxJGn2iQ0dxkJ//L8ERtUbLYdTw9b7h9Bg7jcA6r
	 mstzVQkJbMMwuB91k8RWLJnkhOa1EaPfDy2sWUZTmjuKuGHn4kuGZggJdgTLao1YpyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgl6mHPa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMQFhAA9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D3606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 206D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgl6mHPa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMQFhAA9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNJrS3440235
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZP1stIFjrR21WZH3nap4hGQw
	nj0u77S9FayUUaRW8Zk=; b=Cgl6mHPaapfmVqEjDLCoi8m8UoIOCaiyU+o1IE4m
	/brL+hrT4eMFEVrdu5g2E8AWyTIONXkiLJXkzjFCPkqHfyKKMyuusXmsJMvmPcVc
	9tzlRSPqI7h8JdbaXm2s6AtA+HO6uPEF7d3IeWN52ptz+Ih/XsauATIF0nFB1K8/
	74Gsm0ztzlG/3knvjkac/GG6YM6E+R3nMjGCMfJeRc633jdP7LXCuHY72+AQiIcG
	0bZkDCzy4gUsrciYDgWOXmim8RD+l3i/HUrZ01tGVh5Cp8WlAtKCQU4GzuXYdzk3
	mAQ979y3apdgKqm4o2DkGIyUccv1kL/Ki0wm7APq1OiERg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr82gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d322fbso534668385a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462921; x=1796067721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=CMQFhAA90A8zgDFfaal0hJGucgt+fkeROOG2ihpZgnY5Jfrk6zK9x/I7DsrYSij7pG
         22BJHDLyImHZyoEkdHyo3+5jgnmIej/+2W660lFtLq6E9UxGsxOvFrxw4bF9lQLKVgz0
         pHqDduEhd5drC9rj3nV8QY+h130+ViCccypNhOL9ktc5wugM4k54KcwKrs18578UBfrF
         YJ5UNv19Xq2JEwiscEdUIbuAn1scik7YnuwCj8FkHwVLn85l+QS8A3DMQJ8Qb0KQcFMX
         frqxG5bkSjbXaDwXTEPjreZj7pWp+y+q7JIRorYKo8Q//QjOm2mMol0+6SFL/GU9Xe9x
         pZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462921; x=1796067721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=guN51YEWOn9rS4OxKK+RaBQ9si1e9Zf+IQPLg16NI7FPggEhFYSA9duVqM71l9kQoX
         h6Sil6jlJmuvgxHwbrgWPqQTfpSqtE04SGuMVRSUJCn1emK8nMkS/KOaUDe26uTzExTZ
         2UW8HIRSMDIOK03V/sF6tFvP0M61qyFvGzuO/gZll7QTs5U5O2C4eLONZiPSD2B9e1qf
         DGkeg5x7eTKk3mIr5B9RTEO7M1XcQu7EOUCcVn6QCtc9Qla13F80ptHSGQClaXzpJo7h
         F88+3CMkGue1xgf080Pi0lxHiUfv99hiY+qblcrSvtCPfuR9efpB007qdYuRzf5SLUs2
         gdPw==
X-Forwarded-Encrypted: i=1; AL+hErGgNmBo6Q0QNv3Ghxe3bacTD2zZ/dNbOaV3RzAVO3sgpVKtGcCBi8I2CIFioe/4Ot7E4G+bpVTynJ6B@vger.kernel.org
X-Gm-Message-State: APuU4Z/88UN9ApwcehJfM689KizrWXvdGKmzMPydZuceBGrdyRzXNnOl
	thdr/8g0bascXXrLR/uM1qE2Zih990PItPbtd45aoFoYey9hjeQeMMAgbSP6+zz48SzSZA1IXCQ
	qugJHZWTpM2kzsPAnSGgy+bmT8Q0MUr44tXaTZ9iEi0orxElCPRJZciDwwjQUkiB9ZpX3sYr5
X-Gm-Gg: AZFdTZeMo4sKkW9ekbNPDE4ZM2G1bA3cf+geAWS264wEU+2snoHeWCWk5hRL8y9fcJH
	LgCBGJ29BfuRXyU+qhsdVpJyv0B7cZVzs6p5UGerEKj7QlzohelvxNSwdHLGSuG/FouWOqkOx/g
	+v8XPTcz1UoWCuFEmjPPOguR7/UVMYFyRivyVPU0WuzJSAki0bNjHvOuq+LiW7Ki6Hyv+BwqsXy
	CFJ6RQe3phzGFiT7C/OVsHZCUmTok1ligd8bsFZQZKRCsQju94j++L/U/xC7YRHQ4/UK5OwfrOE
	KtIZO1jGCyuDjnS5Zp8+OqcVWlWp5+KpeyxMQBWI3NyKDmb3aGtYOez+ZaaH7mvrs+4EyzFNGh5
	47EXRLbqsonRzB7u9shx4+PhAoe5vtTx8EfRNmsYe4x9lu8+8tdM/bTyYgDx9r+5/
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912903585a.11.1795462921212;
        Mon, 23 Nov 2026 11:42:01 -0800 (PST)
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912899285a.11.1795462920551;
        Mon, 23 Nov 2026 11:42:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm24938335f8f.8.2026.11.23.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:59 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <4ktoys4kreu45oyhzovmdc3pryzcynecdwqczuzjjppqqaqlca@m4flgwzgfpqn>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3pFTdVBjW4RL
 selyjzUYpHhA8KCmB84+YJo0B4WKkQIpUC/oGITi3M+Kn4hNrl2BjnR92B2j/vzX2sTVYmY6iI1
 ldbceE8+L/XmXg6EXjE2BaRuKVrGQSg=
X-Proofpoint-ORIG-GUID: H_CHY7-V_Cx72EM6uYNbcwWLbn2znaNe
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04970a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qO984ec2hPs5we56H4QA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+6G99MXnTzAA
 PGahs39Jr0XR+TAD4PAwo6vTederdSFltWe07PN6pGDrqN+pLlBmwdcIuuKwcHFJPD/FMXQ6WWy
 dlYRafQEKcEAHq/FI/Vr0nPgYjs8mrFv6XyeUyy+v1Hm921Kl7wF4ZOLKS9Vkd3VD4Daq/EQRVi
 q2bFhmdaV7aj4gTrpDmL6wtojfLZw/8aAWPg5HZYTJH6s9E4C89IP2WGWFnLb16IQ65GUYuEBu6
 9X+i9oammfJ2TwWio+N4AKAaYYctREeRMPhPtB9FXAkmL0e5Rwr8pFCBdSeVhZLuFjjtJcTCpZl
 92nuY6Cm4rgh20oolkVSTXQZt1Q2G2QGgNSxPt/ZkzkeUSNlaMUVHd+d+iOktMp3feYMSMyX4fs
 6sgu2k29+lSGZ24/DjNxUjv0nMEE5d3E/i6k3xLkv2fJXnBsIcn4guTDrLZOR9KInz3UyN7ZX4+
 WCtnLlqVvtk5iSMCuEg==
X-Proofpoint-GUID: H_CHY7-V_Cx72EM6uYNbcwWLbn2znaNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:47, Bibek Kumar Patro wrote:
> On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
