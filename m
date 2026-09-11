Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB8450412
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113354; cv=none; b=sRFrzrf85G20pMAnkUamV9ID4FjFIatU5OKXRJB94RMcyN+kq85BzOKaAz4o5hehlrKDUXttASJte7bnOCvqL3TNStMyRrq+IPIfMNuak/Rc0XdXIJ8jydFIGjT+UaK5VJshIp8R0KPCbzN3IGPf/dbzlz8lH8DiX+vAc2Mdd9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113354; c=relaxed/simple;
	bh=wJKsCd+DULH+slTkurspopCwYo4n15toOWpCG+aVaa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3NlFRcK0GKh4heMOymvLb41lt8G4YQIR8nkJ7MqysEI7N9lyf2Lh4Q+8yXwfy4RawFhLYbRQpzz7cDTv2vf73IQgaznd9qwzHxLZ0umiLW9Vg9L5UXTCkEzIPG6GYs3JkckkhSujLbbcqlDUyqGJewhjCjSVg0aUayKO9DaEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lz9RK+7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRACjTVS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lz9RK+7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRACjTVS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7ku4m3513995
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tv5gm9TG8CS0iIOKyh/RrkkI
	cny2+h907Gb8OirYh0I=; b=Lz9RK+7pS5h3Kv2nb9CwzdDyZHe6PHvTp7lvgO9P
	eyDZwU8Z+qHGZ3YoPs9feSSp2nbkuhgIz607uQXEpb6E1kMRfRINxERL4p/D23Mh
	3KP12Hl0o3Eg51JEd0mXdRKafTv6d5XfOv3cnrx0x21N63nfxDaQ8jY4VNbHEpfu
	ht/Wt3Zg9UX/Avy9zL/GoLd8jmrFDoqRv5NoEArCD9ZJHIleslBQvYEERiluJo6q
	MLQQ1V2d/l20RbW8Et0LqYTNGBzwBSsYYkgeL+Ad4PttJ4Gm8H2nSX5hN8AU23U/
	ZHRqIIte/3VUh4RCPg6mmNOrQkylTXfuH7Nv70wz5qUWuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd50ju1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:55:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso32117985a.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113351; x=1789718151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tv5gm9TG8CS0iIOKyh/RrkkIcny2+h907Gb8OirYh0I=;
        b=JRACjTVScrUzApmo+NZxrbMpC/WIXnMYhKMEEuk4EppyvjmvRTqLSb59u7mw68454G
         XgXuUJy5yR66Zt/wjbfv6Px8gxHEV880CKGI+F17EndtRnid029B5lZqHFibc8GLdnVU
         HhKiq23BMHGGjD5cTx0RHOJ5DDDfb2hpZVrq5fGYOTBMT4AuFKt6ogmwT4kdMjUnWlJp
         Yf7Ib+2k5YlWVFuh6jQGY4/QjvNwxkVYZJtUlDmVqG5dkIyHUpb5JQyUbUGvdjGgiROz
         TpsMmUdLIey/tReo0HDTDNEPDCSfuGr6ZHTtCJX/3yEcaDVFN8kSbjSGkezEQamDp02l
         c0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113351; x=1789718151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tv5gm9TG8CS0iIOKyh/RrkkIcny2+h907Gb8OirYh0I=;
        b=sxb0baRfCMly3DVdRHjSDepCO7SRbjK7wR9aI/7f8XLYgj3DoJyniKEjGKTDa3e5uo
         AI/gLW40zX6fqOaOb7dbzuUMlEkvf0EciwJgH1RW2C+d+oOTdtLQlrQgt/YFPiba8ucR
         ApbrpSXnAg9aFj/NWhaxz1nnteeMAAaAiQfR+wX+gUXKlDNtKUvhLz+4NBUER7ThlIsv
         SRQ3RKgw734ml7NgxxUyFyZcEu74EWbfkDahdRA0G9AEzgF39PcAmdUEoncPNRs66je9
         c8lElcuq0Tdq+zQbgTg6e2CwXkKNO2CMaY8cYixq/bHEQwCN2yP175q34RetCp0hPMg3
         N71g==
X-Forwarded-Encrypted: i=1; AKwUvBwyiPf6gXt9+a7Ge2YD7x6NVmbR2KRX8wGJLZKGKqArba1VcjgA1VJqirUPKxHS5e8DFFNOV6kKOL2V@vger.kernel.org
X-Gm-Message-State: AFuF++mT+22Yn/A06lc4aeHhY/dzh9+ijFenbXYdsmF2p9v7dMnndVJB
	tPuth1xA3Dx/ZUBvORPkZ6XpC74cRuzq+g/xB3yrHCtjCxVDBTCG6b3dS4rYq0zadaE41h1aFu5
	sV1niF69irCRJnCLObm2rYT1D/yXCgBNF0hx+qsfvfb+tjTTjguFQMTNdYIV7LX0w
X-Gm-Gg: AYBFou0whCIHpDgCZD/6SxPbai10ddW6/nlBCBYzTmSXjiQc5XvqDk+38DF2c4erZ7D
	nJV8GUwdssVPJ19ZbtflcbNXPE9HwGSTmcGUW/DFqXPkFH6j8fXgo+Yb3xgoSwlUI51/KD0zUoI
	Df+f+2gyPozaYHvMlZGZM/HhHn9/FpBIOkT6waKPZvaHnxAOfvZxcooVK/xzTkxjV4OZcEj5EY3
	7ejPhxexCvKVc589ITSoKDvr84omBuG1HJbrAyZVUacoq9aJL8sBmb/PexIKMaI7rEoq+GvZHZo
	0ln+gKEpEnIjOd5ondDFsUZAM6tVOZUM/tSH2OgotuIGIDw7szccjNGsPyDjVk0vztfCE3bFCMg
	mPLk0aF40sTJbeg==
X-Received: by 2002:a05:620a:44c1:b0:936:c026:be61 with SMTP id af79cd13be357-939ea053551mr399416685a.13.1789113350567;
        Fri, 11 Sep 2026 00:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:936:c026:be61 with SMTP id af79cd13be357-939ea053551mr399413585a.13.1789113349986;
        Fri, 11 Sep 2026 00:55:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm3968829f8f.10.2026.09.11.00.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:55:48 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:55:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Message-ID: <24kaa6oq6v22hnngrbyorkvr2nkmjj3pjuevniuopokoportww@nfx333n7zrak>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-2-851ee4bc0eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-usb-shikra-v7-v8-2-851ee4bc0eec@oss.qualcomm.com>
X-Proofpoint-GUID: zUzRsFIxEyzngqKlSeU1COwJx4LRTtEo
X-Proofpoint-ORIG-GUID: zUzRsFIxEyzngqKlSeU1COwJx4LRTtEo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX+gk5ahBmdJKh
 MBCAV+bC6lAfdYu45EZJA9SZhPbJ39RSNhW0ZolydRXH7/dLxvksLJT5bJZp/vRBLUQ2JtMATkd
 PoJOCfZEtvdegwa09C9JeofdFWdAaRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX2sgJUbj/Fn+Z
 OXcNFq3oFvaiU/Lob8KRiGiViuwqWQ702hCDnSQMfoo8czYIzTrf81mOlpc5EpY65HQlpkKG5RT
 FOEFVxoOwbYX+wY054Dqb4edNBLcY4d0IpRfh+BPe91qa10lSRduQ2/pe4IQ7Sz0onJeAYdrpk0
 qKjOlxZTETCuJubvi8UUM+k1saBwn7J8Wq9QjdnYO3IFshJufF2f1tsPN5RcFIvv1V7q7BkJXYt
 fcemmJLsDhaf+gfIyaK2p4xWLoxAFRVWVyZ+x66qm25W/cxuLaxQzxBLUrU67icSwNn7znBM7js
 +MZ22a2txa/jTXXg2gWnJatEWs5Ts3vPwDsPVvRjGenr04tqk6K5AZbm2Xk62+VtOsXeiE+MvtQ
 UCocRcdjVTimDR4YJbtKlhcl7FrUk/PmhqC5auJervOxyMjkXs/OyHyMek5UgWV/jwM63+1rIXI
 8fhZcSc7llNz8sU8nAA==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3b407 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0h-yqrj4mlVLKWl0i98A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110109

On 26-09-11 11:37:19, Komal Bajaj wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Add support for both USB controllers and their respective phys on Shikra.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
