Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BF53112B2
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734618; cv=none; b=WcguLLq9nEOrHUgJMWqmj5fPz/yneWT8/THbFGQihpt1OB391ye8Z9xMdL1Ek6HaQttz2p2d2LJcCy0eSBv83EovUGi+v/eFdUTlhLCdWpf7qd75EkesA9Qa71FVnYEwyB/aGLDokSb/wDlB/DDf+6KeGJz2wLDcPZjSWNTvx5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734618; c=relaxed/simple;
	bh=0Mg1LmfUmbwGwuRDDPdkh2BodtU8yrStOlEwkv7x5NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdaXqCsO4M0JUuZggAyjvy0uxZd3ehM7GX/kTUvIz9fTuOzpJ1TkncgkOyt0a3PuSWL6vSyDy7jwqiXmK/d3l20QX+qjOHBpMVkgCl36sQD7Z9zTTDhojVIciCyX0Ub/XGW4sSQEqDMPOwy6hWyzKBs6E+CL7WQI9wJ37GcdjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ6t9/oy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOB9KooA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ6t9/oy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOB9KooA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rw3A451482
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=svX2qK4fPMxxXoNFfe8mT3eb
	lYJyvxB5cN90dNFCI94=; b=XZ6t9/oyvjYHAtI6lAkPTJCsmAaKuPK+cCIA7neI
	qiE1zSqiUSvZpYoSDAtlFidnYuhEfi5K5aUZOi0Ut+Srwc6n41A0h15jIOoBNmq5
	U/X4LhFJ3WrP4HWkmYMnx4cL0IfZ3XEOMzOCh0RegCIvRKP8wcq9cGPznt+PeyRO
	zDiQ1YeyW74zvzdILvwJ4iwkyCMJZYC+f4MpUCUwpTDztElzQu1/gEKodlmjC3TL
	5hHZK3ktVjAGdJy+zDgN618GWZXin2L6CR+thg+D7v2RrUuMHIl7TFUUuC6s394o
	nkRk9x5xivMM57X2ofXLLDy85K1GmSvnC9gW2U4HsaejLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gh93u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:56:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso4107081cf.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734615; x=1788339415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=svX2qK4fPMxxXoNFfe8mT3eblYJyvxB5cN90dNFCI94=;
        b=JOB9KooAS+pxzgz+D/B9kqWYbNj/2mfhTdIPO6890xO0tBi2d2I8iUOUcB2mDPcZEC
         d3cBzUStVm8Laus61p25FdTkxWrFeQiSe12VJQvxjGwRYRyx6xIR+eiDF6VkRbPLfqpl
         ouBMrpu6SivSJyZPIqpwVKjCUSHjioCTNmoC0yEetKgRPY3Xl6VtllhazZGtTn5PWduN
         XijGgrO11gO4n99u5nU9Kj0eHAqFbH1gPxtLPSWB3UcuGhgshRYjGArFvrq6sAoDc+Ri
         1oAHoPep4puSB28UW5Njnd3AyTNnYoFYirN7xNIngB8yQl/bUYeTSXEEbCoxkohCCt9r
         M3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734615; x=1788339415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svX2qK4fPMxxXoNFfe8mT3eblYJyvxB5cN90dNFCI94=;
        b=osghJVf95Q6R98OFGxDZwlH8Sx9I6Zj50HvJBktRPT5HiJk3KMERZd/mYVk4P5Cw3K
         Ybvwdxa9Z9d4nupoQ7YPDtB4REB42nR1AQyRckzeUAIWY7QKPCZDCJpUsINWEy696qXq
         BjsDG7ZW6MAadV1W1RQ3AWGGJ+KV9zdWRkYoSiCP/cDAsSnVl5/q5S7OdQaOvk70Bc4o
         ZLPq1cVmhop2ODKkTkQ00+weA7Pz1QD86Xq3j1u49o/j2NBgQK5JVwrztPZoovem2vdK
         e5NnLgjA9KB8+wWG9jKWHJ8GfqnuMbBHRtfXHYnziqnzq525gZ/GyM5Tahz6HKVhSi8+
         a/qQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBW4bZ0CcmXo/MxafVkdB3fuKguXld2/yzUmIUk960r5CRnJPQKnW4axpwvgZIxxsbOxWR6s/u8jjb@vger.kernel.org
X-Gm-Message-State: AFuF++lxKHOufdN4uGm4d0fFZyCiWSpngsAqB+Ruog/F+MH3cZgPzj2T
	tGooJHhpBtYRBamIF54cZguAZOv0UvPGKioPZturJOmVGeihCbwwHW22tXi7sim4hTataQbG5TS
	yOK1W2aFavNtvCuWiTlNFmh6hiWLr01oSrRG6WlYT9hYj/309bf/ip0oF8bqYTsts
X-Gm-Gg: AR+sD13+haY29mneu0RFO9yZuH/wIAQa5gjywBJkXhokwtp5uf/xdXjzogn+iYuxsZh
	cPqHXQJP7pudqaFOfxDDJhTFIM0Ro1aN2XogqlVXcGegQFV19iySInRfaomYJ3jTAOmUtICMMiV
	lo5g0Oby9hr7WqG9KLVuhsAom+X41t7T7hc4RA4EnHD7epP5guQ80GfLTw960sxJqOHDySYV7dj
	yQtar+N40HQrsrORHJIFMuDrRCWIEaASXWg3yUp3gxMs5iiwaXALty+xV0P+l6g3AS4e4y8qX8i
	DNQctTY26HdqrdTKw+FOmpuKAiI05snqLC3irH4iqr+QoddY+2plOcM1kijMK5skLtFG7QfGvfT
	Mwsx2FCAJw9X8
X-Received: by 2002:ac8:7d54:0:b0:52e:3969:79ef with SMTP id d75a77b69052e-52e423ed557mr48995151cf.41.1787734615163;
        Wed, 26 Aug 2026 01:56:55 -0700 (PDT)
X-Received: by 2002:ac8:7d54:0:b0:52e:3969:79ef with SMTP id d75a77b69052e-52e423ed557mr48994811cf.41.1787734614620;
        Wed, 26 Aug 2026 01:56:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b5e5esm2887159a12.4.2026.08.26.01.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:56:53 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:56:51 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
Message-ID: <pyg3ggpvrrfvht47vk2lky76wktrkf2loxxkljkbyfqlxiebpd@kntau7csf6gv>
References: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: vBWviPIT5hBpcM0w4-cFwZ-TNKhFZm-i
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eaa57 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N-HENkHhRrIbFrF0-YsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX62zmGtfWEKp7
 0iOgjftXJY0G4qzHpgyqAo1iKDhDIUzNSgU+foPTfnmZiIQaA3j1orqqd8TgEA+v1ZptJzfMpFf
 1L1eBVWJLK6GpmZeZdlY+Y+t2JI/Rr4=
X-Proofpoint-ORIG-GUID: vBWviPIT5hBpcM0w4-cFwZ-TNKhFZm-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX5mCZdyxL080Z
 MslUoT5dLiRhU5c9OEvOp1Dd/P2hS3oFkYFq1jsawl56Wx0IVmn9DXi/a5brqpB//avmiJxfUMb
 b5R9NSbFfDo7iSYV+Mgk77qy43zl7EOtNnf8ddb0AFehM532q8u7HxmRqWSKaq5HkdAQP/1YvjZ
 QXJw+NBjdUQTH2tDmD20pxzzEkx99TsWP3mKwb/ieohaxZQ5aIUPso1iFnDMFn5zuDeid8UJjMr
 tBdpSxFuK/wFVGCGjc6Xml6+ewaKROZ2731uq6TtGLLIQE/IX3bDdvoi+wM90EVPqdTEWJO2Y8E
 1A/xpwkeQ4V00enKTmzE6jyq+nM4nBfBC1FXtWDeBQmyMY5yiqimEU3Mi3EZxY+Ex0hxCwwBAZo
 Y+TFtAvSjJ8YYQCcNnHSVXaHfBjoZUgVI/HhSV72qpEvfqzaMwGFlzJrKrMlVl6LiJ36ArKJRVg
 824pozDD0WowRBIM8WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260073

On 26-08-26 16:53:23, Shawn Guo wrote:
> qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
> directive, so any DTS file including both headers carries a redundant
> include.  All affected files only reference RPMH_* constants (defined
> in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
> superfluous qcom-rpmpd.h includes.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Nice.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
