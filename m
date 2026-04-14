Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF735AC21
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151623; cv=none; b=uVRuD3RS3Pm9J7wa8GocoqpniL3dMm4WJg66/jS/JdKH+imGCRDgqjKEvXUH+upNWj3D+BNMIXZlDrgcqvylIV7TyCwdAN/s85bhBuYPb+fUG/zzksA8/BLXU9eXkidV3HLnlx+Hu3ntiopvNb16mhU44wUsMb3wZOTtEUuMaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151623; c=relaxed/simple;
	bh=VlOPumkEPe6xgDVYpZcw7DU1aGOMfsdrGmOGQW7lkY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8jaiw3NFdwcNt/3+Ht7AZoU6iiCKFqOD10LL6DcbDfYWTGLSmG2lu8BJa4UUYK9QbksV2xllIv6cqfs1psC10xAEbzjI5CWwMBsWgnO5Pw1hFhQojsEYHmePD+4i455csrZ0fE+kKlBTq1xq9sra19/OzvDiVVSM+SReJpEVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6JKWFAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXorfyqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6JKWFAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXorfyqb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6R5el3681491
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Fh/Xh8l/oeNuFIZkbzGwlje
	L3nLi+plIjkSOdRxDHg=; b=S6JKWFAEa35g3mpWwBvpeSgFt11psAcwIviIGOn7
	RD80oKxQXNCzODxVb1mZSO8MZiJnXkRTnxv6vJjUUx/G9M5xh2XRyB64Ul8y76q+
	mTj6fdu+zj2kIxnxX0K3FLHH/Rv5Gan3gRuFBd+HXc/JYyRZ/tndQz/eZMsVV+vY
	uensluLylC9MtDkz4CnYD/7le4VgMLn+23yVCMCDjWK4PkIkqueUrYP+cdrk3lm4
	Vm+sVVG9QRT28Ajgomqe9OtFOqNrwFPGzam+DY8b1hRMe6AjWy9dHK/OiAWJ8Z9B
	XJ2ub9MivQ0h6vopXb2WxnbvhkiKXh3xBbHDhcsyfGTAsQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d1hy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:27:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f06f16f5bso4478065b3a.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776151620; x=1776756420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Fh/Xh8l/oeNuFIZkbzGwljeL3nLi+plIjkSOdRxDHg=;
        b=FXorfyqb/KiGIcTWrjK42DZKGHrp82Jf1b/mS8gKSRIG5NdbFhNYkmsq6QnRmzGFFS
         KfQrDWkLE1fxgI7WWQDdEKrpP//Avo4fj9cKo8VCI3RRYDTwt/ID917x4YI6FV9l1LCS
         tKqT3hRqUnlSfEul0QTeJ8wLA1uuiJ8Rp5wBPTygFALUBJFBoRck8yl3ZFWdh4TiReDQ
         7o9SS6eVtsvGDfCKi6JuDrq0ZPivAVeYBpzgGG/DHh94Sc/2PsCa1DJY63+m9OAQg6uY
         nekiHIyKFZ9DOTR2vhKVbykBXn9vjKZ0Ex6hWs2XhgKIqa0FNZoe4YMOmJjhM+tZZamI
         akag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776151620; x=1776756420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Fh/Xh8l/oeNuFIZkbzGwljeL3nLi+plIjkSOdRxDHg=;
        b=cCgptDWYIB6BA3OudcxBSJcNuymiGHj1UGb6pOvt8n3TDD5b2sd5sksitCkbDSraNB
         KBcHXmLJNNC2XTOD2cto3jYrimpRXPELIYJiEQtFSAkZDJLwBtoqacEcXZCP7gD6bkTf
         /7VaZsXvI4W1+vfZF1M+/g37ILpMOdq7uXDhCSXLjnT/ZoyTKvF+ebjzUNxbbIVQlwys
         CzeTnxGepHZvLGxX8bnngcH2dqtwsKAXu4mlYpuDmaqtoTvHt9FqnGdEzfhMJ29h0dWw
         jQarGRS1zNuW4Gw/oCyT5j48JXU0ZLRidoHb8+FCN2oB+bREf5Cjj2ZRrva9m/qt4OBW
         ejeg==
X-Forwarded-Encrypted: i=1; AFNElJ/pnDvRNT5wa6BlCQyy18T2aWNMckUDqVCbL/UqQJsdK/sbp7exPZq6jlrG/QWsyuG9UfuGtkZqcE+4@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMrLKl9p+P0sSaDzC5Ai3h5EqWt9FjGYBdl9dnMvnkhyVIagH
	O2m1IpRMFRgSLk2hKdCQpFxJXM5ltQWwrx5t/pwMNKr7tZje0HHHamyV4M5FlnfeX1Kw2MuFHr4
	0fOUsDPRC2VsUaKPNIoC4fsxnOfIpruGFubiDQ/929mA74wYz/b0NiT+0xgO7yVpS
X-Gm-Gg: AeBDievrOVM+XBdbLromo8auhtR4rWjRG0Z3npZmJUVRsut/WP7ZoqqPW1E6dZ2uyXb
	J1etTThbB2Clzcp6Jfpmzi3K6Kij+E3TAKajsr1w5gVoM80YwVLoKWkXtLOsNyuoLi8ACE+qQJU
	4qKWBYhOtbbYWeBk8W1BYD3U9igyoqBF+cFdZnIH5c0Qua4mszzxYgZC6AOTDx5jXDyInArw6r9
	e36xnRVr+Zg7ii65ZQolF7PFpGeRjQJT0GRnLwepMiwOWWIf2Ix6iaeVXyZazCuhyD26F2DYnkQ
	beboV8pn0deilVDAQj6hJew3KGDoJfBnvzvQsrChJC/ByQSHCNtbHvlmEVa6VM+IXNXplPJU95v
	NCDpaxlnxOW02q/zCcuEyzHGq0bMC83vFTfIGYPwbzV1/H6o5
X-Received: by 2002:a05:6a00:2d84:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-82f3a1e58fdmr7479889b3a.22.1776151619794;
        Tue, 14 Apr 2026 00:26:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d84:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-82f3a1e58fdmr7479857b3a.22.1776151619250;
        Tue, 14 Apr 2026 00:26:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30e5f1sm14297189b3a.11.2026.04.14.00.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 00:26:58 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:56:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <20260414072652.yfedude6lvqltcsm@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <20260413-delectable-fair-nautilus-ccabcc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-delectable-fair-nautilus-ccabcc@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2NiBTYWx0ZWRfX6SognCJ47kUJ
 xB2zZZFt8MCVNx2lWeSusCjudJgC+4VX4PwYLzH+kIy52QZhNGg4GsXVlqXgwDQXfNYQ2BJ+mkh
 jXVCrbZNURPwCh4Tl/r4VuvCpWZESD6/IWcGQe/cEFYatqURIDz63JSVzjK58BVqNuA1gT1EE6r
 1bF7/i4sKcf4QEaemhZb52STQb2n5o7Oi2Lm67goikG9QcQJfQHr5d9qnuE8DamqKJd+rk22MQI
 Ew4Z3JsJ1Z2G1laeergT8PPN1/fruSmF4g5n03rDAFI+6rdiEIbD0XFlzqMmQbCZ3F3LacpiCsh
 1CYWCkiV76yqE7K8+7KKHzK1YOqMD5J+XNnqmnrrliEeD2SO8CEPA2+p4XpRt4d2fqUoogasUSm
 xnvufAz5lIZL6tZdC2g67RB1H2yYOC3FEOrrIx1329WjfoHVKO72TmaIOV+31uAR83vaQDAG110
 QWOTjg1wmIBIay+fiaA==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69ddec44 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pElVEfBAvB5jv3hcb-wA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: XOCOUTwTdMH-Hm7T8rsxsYrnbjYLj_Js
X-Proofpoint-ORIG-GUID: XOCOUTwTdMH-Hm7T8rsxsYrnbjYLj_Js
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140066

On Mon, Apr 13, 2026 at 10:10:15AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> > The PDC has multiple DRV regions, each sized 0x10000, where each region
> 
> Here and in subject - add "example". You are not tightening anything
> relevant. This is just an example, it can contain whatever "reg" value.
> It's nice that value is real and correct, but now your subject creates
> impression you are actually fixing something relevant, but in fact it
> has zero impact.

Ack, will fix the subject or if this patch is not useful, can drop it ?

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha
