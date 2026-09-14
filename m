Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00725445AE0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385238; cv=none; b=LUCjsMTy0TguqHO2JrSf1iaQ0v3zhyd4JxlvPz/q/mBJkNYwuVaWNgUqour50c1s+9Z/5ftFUGUBAlODVV8He6xMW6RzSRNYpmwy8MTVqzL1jCIKMjn4XJpPGE4uDQTDMlU3VUi1Bfi2H6iT2OfxQKNe8h5nYb+yOk8EB9cLE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385238; c=relaxed/simple;
	bh=S3cHWu7xcUvy0eCh33hOcgT4RaUxYY6azMPOstL4lBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Jyhy490jfAHDElnttdX5djx3KWopZFsEE4rPQNnmVH2zls3qknwY3aVUYayhDozd4fCo0Bco0hDfX7nTC0OwBR0mMNag+nwsFAAwC5d3b7DyQZ6g8z1kaDvh2xmRT5g2U4N4mJly+98NIivRN3xArMYWmLYHIzEelgHmDz9CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GosI7bja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkNG6nSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GosI7bja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkNG6nSn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7NL530975
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IJCHzSLhrd043XzsASUdlLLU
	ScQGc2AdK8sGqJtE+JM=; b=GosI7bjaYzMwzcEP8402h62t9XHfpySomYVO4Bqk
	fSybZG9pT8UqZyqVN5Me7TOq6m7Tj1XDBr0IwPwwxOQBrQSpygh7HhiomPQxsJ25
	63bazsxsFuhHZhd0wYAN7K3bZBRcbQJNzRS0/STG7Jj/jh3qoBEtyIzGP6SeNiT7
	lvFKvoUD+OUG7sQxVtMIW4FwO9Xeeibk7YXDf3F8tv3MmXavGokYQCUKvPK+qfBn
	ks8b6L071OKQJOKth2ahP5De8DtjA1LnWice1oB+PZx1dAwZGqUwUzx3e2/TkZ+5
	9/4eZv/TsdFWd/ka/EbDENFxef8EeGLiAi1isL2Uw0Ma5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst7fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:27:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso542409185a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385230; x=1789990030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=XkNG6nSnbIyG0mrmEUJgkhyYesi8N1V+DAFl8UwY7LBi5WWB8jowMfS1JXW43R3P5K
         5Al0xvCGFl5jIn4KNMV6qJkC/ME3fgf3n08GOacAwBox5VWk4/pQqag+XoWYzUvp/MJf
         t9ZpkMkwhNjcXVNi7R0EALX/o7FIun/6eaAqR5q/Fn7m57XB90yOKF84WhDW76wSfJ2c
         YgvyxpsIjlphj28Px7s5+g1oxMlKifL5x9MTI0UIpMjSpSbOP5NlkuW0zgWmSmoRlJhj
         wKJLMwAXCNfcFJjJLp5/dY2dXcYQW99h9FsgFfMlKleCOOTuXPPGBzCm4sfwf9O38BZ/
         RLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385230; x=1789990030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=eaVi+qmVA2lVGKTwSVpQ5ezwtf19q6gInFQc5PnFXxyH0nNwA6hWmbelHWyHnAHUW3
         JykNy0In4stnnA1Upiisw4MWrqKVEkLWgCImPvOJuNDR78jakK4BIr4wy68CUdnbs/+Q
         TRF2UiQka+hkRffKkHCab/Vj/OPBtuWTKtGSivbnpafLHBrajDLiPEu0j2CoiI9X7gjL
         KUiAZdEg/Lfv+8uFenCo3HwLZAeS5ecUSJ81nm2DTaXeR1rSLBROmBOtNhhMqnkq33ZK
         +BMKDyHpflfSs3SRbPLQdNzlDQBX6Bi8iSNFcJ9QbPJdxrysZ206PysKbKX30hndl+Z8
         X0vw==
X-Forwarded-Encrypted: i=1; AKwUvByc5M9dbCk+T+AsS+Wz5TTf03//IHCpM0UmP2jtvrXquw2k9+sx0QYkQhnH+/57AFH4eLMNWo3wpy8B@vger.kernel.org
X-Gm-Message-State: AFuF++mW0RaXzT3wUeuu4Jqdq45Q216PDMGGjp1VNi8smO7PSCMd4MyF
	LLioWuDXg/96sGAvkxRIC4VaZ8WVjpV0LQyvtEnpEDCCIAl+bLK2eh1A00elXCycgGeUNAFflKo
	450BEThFwD2LGveF/TAX5Jz401TTRvbVNmELOy68+uky3OpF4mmAMfY6eeC5/k1tZ
X-Gm-Gg: AYBFou0/Yk1KdVSv2c+KZEIRS3H0VosGYzAOLIbOunlJO4G1Wn7bioQMNUEtCU+4mMg
	/vYXiOQPlL3G6huqMU5G3z3mdSTbrvcQBI6rap5JQ1nlXNcfsa96OFFkyh6oKHM18uRf9RM5wEN
	30k281ocnfL+tYcFrg5iq0iVGVEngOnl0h5ituk4DvXtUjlD5K1wuTNH8smWmXk8les2tTg/60+
	bI4v8fswYdCjKmOkz35z8hUcIbXw4oz+jM+Q52U1AibO1XRgh7dBiekVluzf9+/vgtWgljfVjRc
	Wzj6Mv/Xqss/D6O3lasyLl3KbwvInhc1h4bdxnoh93yfx21f8xMq42O39qwEtQXTigfJfnm0wAi
	c+xzsF5SS39hjCw==
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277725985a.21.1789385229621;
        Mon, 14 Sep 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277720385a.21.1789385228954;
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm26107741f8f.9.2026.09.14.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:27:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: eliza-mtp: Enable iris video codec
Message-ID: <ccceh4gy3otlfegvbd2macgc2kend63gorsak2eukap4jm4vbu@q5pcxpw4od2s>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
 <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfX2QkJHK95Qzsj
 7wsrm+b+gnB4zFjCNUrsYkwin+eh1OSbGmqpb7/00Vy/KwkVttNdwA9xxC+YPBxj2r2jyQ8aJv/
 w/Jq5ZZvBaYHenDK76EL0qL7wWNQimUtb0cbb1CmBJzCocnqrpXEdSuQt+/i18xXxz9WSpBSakG
 BTrTm7+VmIPCmFLORPNg+GnJIvW/8TSJQ00Uqga4YdEtwW1gC1HF7qhjH/Eo8eQ1SRK4HOSh2q7
 hVyjmM5ve0fjLbYnzwSy3uc39y+TKYAQ+TsuMPbbh500A6RdjZo+rtLClUHesIhlXB/5wHli/YK
 ECv/KuBSMbYSjrsK0cq3xh9TCCMFh8dXpzD9HhenyKe7L7s0me2I1HRc88SrWAvURpnNAgt5QGx
 o1Suy+bPXc+h6Qc3xpAj3EE7q1Puwkb/JDqQA7QwbSl2mP5Io2KZ9mVLDsRscVDE23w+1y0A2sS
 OjsL9mAHs/gnQYSscCg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7da13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zFfZ_-Fbgzo0WQ8s5VoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4PMXupWdm50fifUdBmnHQOcsC-Jc0o8t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfXytJ8GZ3MRqLG
 Gvkn8YGXvF3LiYW6Fb74tWzxPbevmfFG7D4R5fJuU4fzPfu+s0RfYu0yA4EZAhFcRBWV7nXLdaN
 g/CtUaTBnf6avG1YPBQVNV3SAxc5nQs=
X-Proofpoint-ORIG-GUID: 4PMXupWdm50fifUdBmnHQOcsC-Jc0o8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140162

On 26-09-14 17:54:26, Wangao Wang wrote:
> The Eliza MTP includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Can you send this for EVK as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
