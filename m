Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA835AC00
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284583; cv=none; b=lKLeC+Jt1rMs/Z5Emkvs8XeMJM5tUyCAf+pNYk9Xn0D0zyQZWD6XOY1CWxD7HA6KMsbysm2B7ryNtJbB/nKKVeIYbTstNIo+PRThenvANkp1Nj+9oEnVKP2PM6UHyWs0s70zkIvcjvMiB1cn7EvCDQjrcjKge4n4czI9on7AQ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284583; c=relaxed/simple;
	bh=zeM5f2R2wS1XwHGdgeiJF621JTCzXNAtYsJrEOR0Vls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKfNIBbKAxOUINuTGqshf0HADwUmE6Ki1NUdDO+bigGbvkWVGTSijuafn24OfW82lfQqryMunKKj/UuMlNtXSbLgek+0pu8qav837CR2ovhAtdV/pZIptbxwukiJGUvGYV10pVHncEi9mpl++/VLnugwfYi7SGVFlsYSMgjPchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K02t0Zgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXjcywgL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K02t0Zgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXjcywgL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u8UH2522714
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgvfWtTXGgI5yN0IDqmXxyN+
	NWSF2UV/4MJTbhztfkU=; b=K02t0Zgfvnbwwrc6u5BYup+htPNXs7L5j1Sa6ps9
	UxT4CJWDBCWWvGRFoslA9VYGG4CW3YoYJ8I7sXr+GtjnNBfkesJGIAZ6fNt5lP7y
	qY25c1j7ACldLGH9LGEZ02d23zAIK1MAilNjZEd5owqe0/XC4D1vl4jRI5YRXTMg
	/nKMeYUyrLNP900MMULpZ+PzJ6k9p1ObXoEK668Ga+MBYLkGa+Y3VDRUzDIC9aww
	cIdT3Bqz4k69CZ+hxyxWxRSYf/VpN4C2R+LM/FWPcodYP68sZVdyjcU1REqC0i/b
	Llt+TKpsimbEsoTCVGv3KdKT/G0Av/nifnWVW6LbdF6jZw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajh13v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:02:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso500091a12.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284579; x=1782889379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgvfWtTXGgI5yN0IDqmXxyN+NWSF2UV/4MJTbhztfkU=;
        b=CXjcywgL9jHIbXvL18YmD8R8M+I+H1ddVr3pSjil1xZ1X4mEoKsxNBBJIJoEbYRUoV
         8zHjQ6E/sfKO6TJEXSCSaS4FE41NZhAKQeZ5YygIcaI7Lkh033Iy+r7lafPrjy702qnA
         jWRLTzZwhQ35nIY5I2iaUaOXBv/ndcv0zNiDDxAt2cvPL6S+mJWBtTg2AFRT2wPdUFbG
         laQz7VMqX5GT5HheX4094iZSusSrnz/OvG1Smv9nnwyyi0Vk98aT/Zi6lHaIVZ3Ib4KB
         rA17IRfKFGKng7tH23zaznwDZKPNd6wA2GJqpa1oGA8YsGLXHFbcnlFK41LDyC8UqwiY
         e9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284579; x=1782889379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgvfWtTXGgI5yN0IDqmXxyN+NWSF2UV/4MJTbhztfkU=;
        b=MOOPxAjxoa03Uya/ptiurY1XXKZSLvLIdhaItn0p9e3Udy4jSBmgo/nbAlwfbQBtar
         wgy2PjGbWs5/L9RKAYG1xC0ck95nGoBZ8wL+QAm437rd/ftspVX640urG1VvYOlbWyd+
         lInLy7vPAXQwKvlMDpC8gVs8yv7xGIAX+55IfARgm1zv1puU70tO1GvUe0hzcZPFKfNe
         W1D/6CFfU6O3gDzWb+9sJZlDaNqpbOuDAhRughuObMxv5GDzDyjWx/D9Zl6J/ytNDLVB
         132jSgp25uGOK9plJlyk0+pLx/Rtu21FqJSEVMKHLWqx5SqHEEkOvl6wvqHpP8skeC+W
         bkVg==
X-Forwarded-Encrypted: i=1; AFNElJ/XhoCxgz1SAzEE99pP1VpmMF7LTBKMbpAZywBlOMc/kN52mBP3jatVlDVZqagSQvZypZ2q/3cUSS8/@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZzTMeST3NzzBIwWboTPgwFNrrkBoqSk+JR6aQjlMGxDSq/6Y
	iCzdkNEkxJXANqTesARolWgUEQteCA/HOtvFwcM0+RqIpvuhpDEjx79LF2U/zN6PTIfTP5/33Vq
	wAvCZpp2m9gfqLJW5uBGC3aC9SujxI7aawLzuems/xrtYamKKS6yRUA2mXMBVVNWc
X-Gm-Gg: AfdE7ckOVDlvFDBw+VpFXKwOAjwwr9bRmEDz3mLOr1RADnCZcoUlSAsZDf7mvWICZjQ
	SleOp3ImDot35ttH88onX3CfGM2Mx7MF0CoDfxm5jW/ZV4jBEw3MBujqHep7E/3eBFy8vfW77tv
	Kh4ukgCDG1VlrAbKYXo1GlyixJwAUT/DxF0WCegfNuUduyCh4PPoEyqHzSA4RIbyAmvIWKvIb4x
	KF/qRmB1uDDUheBLCjyihJda//240vzoJYCoU1OGlmBdL0AEbkPPf6tzraYj0e+w94yzqPyTQlj
	tZHPNUok4p4pNa3kpcbYS7aooWpLibmHXXKKMZC458q7CZb/67i5vUhWDG2CEkzfCNQfc+xvZNa
	d72M4VzAitgC17ZVTc6CtzTTrgmsc4UwxFynxqA==
X-Received: by 2002:a05:6a20:d045:b0:3b4:904f:c9cd with SMTP id adf61e73a8af0-3bc5181907emr22290773637.6.1782284578338;
        Wed, 24 Jun 2026 00:02:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:d045:b0:3b4:904f:c9cd with SMTP id adf61e73a8af0-3bc5181907emr22290724637.6.1782284577842;
        Wed, 24 Jun 2026 00:02:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc326c487sm11738900a12.12.2026.06.24.00.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:02:57 -0700 (PDT)
Date: Wed, 24 Jun 2026 12:32:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon
 SDA 850
Message-ID: <20260624070251.lxmevkxejkeyrc2l@hu-mojha-hyd.qualcomm.com>
References: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX6V0KmD+jOa4A
 BRTxAMxQQzhTxjFTpHU6jKxThDIL92LsoaPRPKSCZ/ZO8SWWEnycjgexZaNInY4CHO16/MzihQv
 rrOKome9BoAevQYSdaHW5qBmpTxr9TM=
X-Proofpoint-GUID: N2XIihJt2dg37VbFUeqzf_S1t4cYjD1v
X-Proofpoint-ORIG-GUID: N2XIihJt2dg37VbFUeqzf_S1t4cYjD1v
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3b8123 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tM2yjQwG1dvND7ghf3QA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfXzb94mkcJK+jD
 NDOGCv+dmC0uCwCGmEPhwMumzGyWnUNIRuUu5XuGyO6vpORpt6S8NINeHZ96h3pvnrWTlC72D/o
 DRsHC/IL5rg0/HIgTIxeo+vW+2OpDC6GpqJfBSledz6wnQtGEdan3zVluK1d4pjTnMf+OQdMfR/
 K1YeU7x+C3Tqaa194gO3/VSQgV0q6ZXCrJXYr1MZKswjJUKXIXd6yAG701Z3qrYnPkfdH4+MT9v
 uiowI8dejxcH9BtfdJqOr+lbUpWUI/fO4QXCGqH7cPxgmpx7v0Gy54wQmJ3+9jS/0/UOVmuUAdP
 6gIZRNRSzwR9/TaeUdB+pdPqfW8udi7G04ZLQ5p83CpIwCQhbp8yRrLshmmbwN8IcDdbhp8nfQu
 vaCD/64na3JgIMoGAaFn25qdfrUpCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240056

On Tue, Jun 23, 2026 at 08:41:34PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add SoC ID for Qualcomm Snapdragon SDA850.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
