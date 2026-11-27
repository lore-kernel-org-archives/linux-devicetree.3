Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782531;
	b=xXOUcT1IlLMJ2xKja+zf/6aSjH5eIYIQa98yFbZ4Hvd2OAZqx66JtweZJTQjgP2OcDoE
	 btmXyVCdpL4XWeRzW3BVaGCJ+640dhkuNpfCOmqk1uC3XB/eLSVU19Y5j+dOfeZ3PzG52
	 a+LVtiWjaCGlf18WpiMFk3RfrrQudhBNKoBQnhVlQgPBIV5yLykSMi1qCFQSBEAjZNwjQ
	 Waz5XSjc3rZRhUhe0PbW57zoHHDFszaQuQ+nWNyLeT5iMhXQdZFUhE6IR9fL3CBoySk+X
	 44WjTh0uFUDvCCkWSpwcK2NQQXpDEAyEQS12W8ioGUH5VMDmdCGh3qeG5ZkU9vPxhxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
	b=CLurwI1h9EHSQHroTm1dmLFUroeNt8mzCluReG+l3wIbUY11deJB2Oe1IZI344FVv9py
	 GghJnnSV5d4Dfurph5mY+mf075Un8/M4kq+LvjzziTrEk6H99Xj7V4cRSMU4qfpVbhqs8
	 SwYW5TL0m5DN0GXVVkTbFV0M5yFltsoI13MiK+7So64xb8Jjh8Kqlyp9vZx8Wu8wT6UIi
	 0kp6ZpK27l0Hke/K4I0/KqItltV+RpYI6iTKK0BNBSzIHvjhlKuBLVv5s6CDmV5CIiizX
	 lXSeXRSHLPWauP7kVr08kNN3+8XDCfiG8or5aJCUTzjICwiThHTeStupS2JSjXY35rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zv9m3Clx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="glmhuuR/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8A606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D8A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zv9m3Clx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glmhuuR/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp7Ug1376848
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=; b=Zv9m3Clxqmz/Cqtx
	Q/IVh4TuzILwMSHl6w9U+e4JyLLb0nhMGMiwPozvnzrTNXRTHyxRWkzad3zWnhjq
	soPF3+oMqjhQzWoYm3GYgpKZSQOEVH7QBHAL60LNkOQCzQLZPq2BuhgXkmJwp8U2
	Ox04DHwNmQD/9Lem8Vyl7ziOZo2CoLAfFklsfxXnQNoCTM3LKPRAs+wd1LVz3ry9
	ilvtVvqfAYY/oGD/8D4yR4NmDMV7jWy1j26M43MmcrLmlqYh9wM++97Hd2oW1aND
	afkSdVE4QeaDMXMBv+0EebupUYt/nFCaeYtqF6W5Z0pEx93uXktpd90ID71XADy/
	6xQctA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3agqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ee433ab272so316677e0c.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782529; x=1796387329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
        b=glmhuuR/7laWGTqjj6FoQsqHJbVD/biTGl8qIMvq00RB3VCTxW+HLcE5Mb4umKjqL2
         QdRXMXCwWhkMRT9D3PqQh/x2lqSG5Mznrqf/pfi3MctIcmOFOp4qTV2W/VBp1Kj8Amgf
         KSTjCarTSne1NjBO8vRPkDap2PhWnX6ycdkBbtbdCpz6ofNcLzyw8YnSayGrbhGEjQET
         cq1cavPuozTA9d9mOUZw5hqCBoxSpWxT7pfMj3T2T1KQZj/ymzuyFHNBs+up81B8Kt3I
         aeiDgstsoIMpRJgEgCM4OUpASoluAz3FbWPgHmVurWLnlcxXhxnort40/eB5Z+Sj0Wh0
         B9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782529; x=1796387329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
        b=WFC2knV/v7S3u9xqWKjZfVwOO0/j4xLWdolMrXLUkj/GbUPkMjBveNqIhYDq+4SbDA
         FZe/6sduxmrHsMd8+f7FD3IMDwnunvOxA9M0Wq55Fu21qspZQ8dTxCqZ5Naye0yLl5xZ
         huSRXCZrENjncgKMG4TdnHEHc3qJlqBKJuckY63+y3JAE1RR1mX7LFS2x0/FWAhcLni5
         IKZBlof8TPbyhFUiWVR7WbV+y2LnuRHC7i2fz4f5EHaqXAxLYGVTQfgK1rztk+1Wjz4M
         m2DzcNyHRjeEKjfq4D3t2SPhBT/INdb+kPsRIDOx7UNM6DMBwcg4S3iRDTs2hyRAc1nC
         mKqg==
X-Forwarded-Encrypted: i=1; AL+hErG23aU1mNYMgWmsAwQSiBaJcSVCZadDQ8dR9IuV+1ZhlQfU3Q4yXipS6ttjWaHrrTkK4G+H6PPRplB0@vger.kernel.org
X-Gm-Message-State: APuU4Z+5FGCfXnDB1CekcIVE99Rq9fw0MU6O2QGszR8AwPb1GP0cI4vo
	RIuJuOMUJLd99JVJvb4vHQ0RI7EJaCy6qSdYM66bLR40lKTXxtAxN2fOsa4NvAzZblibLXIy9O6
	zu74xzfjbIYi3JMyTmT16Rcfws/nlDfRdtB9kKgTpPTce5tzyXbyIBv2rR8seqkfj
X-Gm-Gg: AZFdTZcaZxOZAdegBBJcDYi58+mFxnHcJ/XmWsb2/bJRvydw7pD+Ru7MCQxha8bnNWy
	9DYb4OqXI9ThOp8eYaiRGXHF1UAyGmER+9QpGO6+7u3HXDRQpeU7V1RpmSNkwd68/FC5n0x0poA
	HL4Nc0O+v+VvBOUV4q9XgpOhdAwB0c2MniTozMlWlOaMjA9W7bKdi5c0CtGODnMKmCMVfQhws2z
	Qk4YwEzyNUyw/dNSOwLaet5AeSy4Kl9K4surj+k3cG50Lvg8KsyqgtZ8UNA5FSkSwjEtWQKqUuC
	tMZUZamhfQBcx3RDXmUYe35bSvmurwL7mcv7dPiCMQteB2vySB0zrYKrOypgLPytS9MZiFF+gxG
	zKOl5Ga9YdjYR0a37M2xcV5S8kae/yMISTeuI+8GjRb1U1ZeV6Tcg39uKPk3ZH/01u5uOz3I=
X-Received: by 2002:a05:6122:650b:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee8ae6b2a2mr16223750e0c.2.1795782529244;
        Fri, 27 Nov 2026 04:28:49 -0800 (PST)
X-Received: by 2002:a05:6122:650b:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee8ae6b2a2mr16223725e0c.2.1795782528834;
        Fri, 27 Nov 2026 04:28:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm840358166b.13.2026.11.27.04.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:28:48 -0800 (PST)
Message-ID: <1066c962-089d-47f2-b658-76ccc627f257@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:28:46 +0100
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
Subject: Re: [PATCH v3 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
 <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b097782 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iSz2WJSI46T3I7h2rz4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: DC-oHqBcbcH3uN1WiPxW_Hj78Zf-aHyC
X-Proofpoint-ORIG-GUID: DC-oHqBcbcH3uN1WiPxW_Hj78Zf-aHyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX+lrXqvp8N63f
 UvooTgx6os9q7b0Kroqsitj2NbYPOvzH3iJcYrIUUqBE6wSdJEjlGkgMGmt7FQCc08UY3qIJBvf
 3kCwAXxqsEBSYuy5ajp5Wl4x6WmIVMCX3mMzc/gdBUUBRtYWE9ipsKlUJCleKcImz4O2HvaZXNV
 /I4A7+nWyZuCb8E+VvWj08zMoltV3GEp2qgaZcl/R01JuEYQB+c/L1P56gvNGz28kjFrX5t9ZbE
 pNpntJuJg0OD/4bVy2ryCWyCHcf6kQpmknoptshrZGQqdsrd8z/VWtJsQrqt4oL6gnsrzbTP8tK
 IbK51QEofYDEyRqaVbcy1yLdJTvalDPRO6pin+cfqyX2uTQV/bvMPPMZoayQlgSvZeaHyjc33RI
 L920OZ+2wVjZkspnW2QR/pqJOw7J0wu4YBdXqocQ9HYnDHlKkQUw9JNUBc21in7u2JGIgVYMd4G
 DWxvQLCgacdzEROxk0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX89BgHjg5WLaE
 iJJa4WkbBZ5VwdlgA2WsFxpv6hD3P+0ekTFu1Q5UoJLXxotezjo7+sAS5jgTl8KbX95njLiVPb9
 lAUrDaQNesx4n5RDr2TXr1S3Oe+eP0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 8:31 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Besides the audio and root domains on ADSP, Nord has two more ADSPs,
> each with its own root domain: msm/adsp1/root_pd (instance ID 123) and
> msm/adsp2/root_pd (instance ID 124). Nord also has four CDSPs, but they
> all share the same instance ID and root domain, so a single
> msm/cdsp/root_pd entry covers them.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
