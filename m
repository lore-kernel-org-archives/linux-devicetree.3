Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B94457DF
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361681; cv=none; b=l4wtQAzRPi8ar2suvQq3xKiUAld97Pg9kjK8p8VYLb5h+Qeg5o19WD6BF+a9aMWKuoFoJ8dU61aLkFgopnPsB3o+NRieWcROiCRbUgKsydtRvL0T6r5HIb/pGHhhnxXEZu6DubrjiXhlTe0oJfhl1IIdN7DzWIMhx9tVTZW8c4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361681; c=relaxed/simple;
	bh=ssKQD9BcM3CQbUK9x+g/1XRHw/eSMfakZw6DJb5SrFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txipHS+aIL8Ieqb/Bcq6Pw2Lt2mYdVs3UAky1Y4FVUWQFcLv/nkV2J/XASToFzdfjlW/rWP5cPnOG0RCSoUfGYMlBlPK4D83MNKrwM9E0NG5O5RPf2K1+9eiWE2VZB8hROFAJq/6YUHzlMkP6jH7S68kykmwfPxgm8F+RtfKz6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj3iRZ0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVi0LiX3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj3iRZ0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVi0LiX3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jRdw118860
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 08:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q8pejVtvwEZY0CJvyioOv3uZ
	UkPCWhEsgph7Y3WL6kc=; b=Nj3iRZ0oHMRNpu8bfSlnIuvRndjXLi6nECGFp2yT
	ZNn4syEZO05KUq/tq0R1NUNJ/zSZ6XCdzmbUy9KIqGCh7tqzlK2ZuHTAx6w9nCS0
	kXblAZqmvVJBxnRCXy6My+ORzRwPfFy1JfrMKipdIupgN9umngAK24gKe9OPlbR7
	cUMRA99Y5LLJF4Nr6jZCtdfI9uvYIFBuGTrY+CmmpoDymZXO2tmm9ofxEkENmjUl
	o1zhg3T6+gmyeDfqFUINIzP6Tmhu5mukagdlwWeqAvwUIkmNlHFPmNOgWYp8YHOn
	gT4T5q4XsoLMWhMJTec6eZjkVJUzIpCOLQBwQk06q9jrLA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58m8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 08:28:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so4335649c88.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791361679; x=1791966479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8pejVtvwEZY0CJvyioOv3uZUkPCWhEsgph7Y3WL6kc=;
        b=cVi0LiX32MBI4wZG3Mej8RJ2TFWvRuxk5dmwSwUFzLoFfqwP+9SmyWbP04Z2jYOT7n
         +v/a80P9N5NBlFE2BJ4KOiRfIbD6yjS8wQ3T7HwOSOUVHwgsrB+7CHqtq/u+jva06IZl
         /FLZV+61t2rmsM6wiJ4eKXGfF5gTPTY0BP7+q5o/qWypekJdHoxbpBMQsPgIKGFl+PQa
         5jFaUcpBUhmqG+AIKtmH6IRyX4AdO6YRX1I2krVmVbyUF4Hzpay6F/yBQi1dV5utwCJk
         YhGPWJ96On0blliSKgMnN3N4JHR63tRAiK/mcwSy6wCMBx6eCuKChkGS2OIXQxpgV3BQ
         /qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361679; x=1791966479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8pejVtvwEZY0CJvyioOv3uZUkPCWhEsgph7Y3WL6kc=;
        b=zKsJgKz3PhU5zejvEZStLX0+rj1xG5LNM6DwvFzG3g0j2DNFcZ0OCHCvBhj+fhYGFl
         /wpQTKe5u1OS2HdXrBKydWSvb2atgEdnO+7i2LtjVh+pNvv4ou6dgI98DZQHgBVKcDZC
         4UZQfHB3DGfrZvY10vK4367IhSRez6Wg8D1J/nb2CM67CeEFZ16w00kN15uNxCGkJpdt
         d46VVODB0C3ygnaNqNtVeBxM4uWO5B0Fzp3SsniqvUQ7xPhbJ5lCtYcL6TKUUNIM/yQp
         mFR0CVy41h9VVH/q4EUU2u9So/V1ICrMGHKW1/BRY7hf+rm3dQeiO2KeVsN6IPXK/9xX
         V/PA==
X-Forwarded-Encrypted: i=1; AKwUvBzu25bPswaFW28aBMo5Sf7jbsRPL6miVTIRP6vTiuCdtkWPabHeOMmqfXkGxapRLb3DIyn6omrSXl7y@vger.kernel.org
X-Gm-Message-State: AFuF++nA0PdrmZ/Anbuwf5OcDrn9r02enThkAqOHManN1IASGgzSMlSC
	2sUTaqftBfl686lGlAi724pLxqkJR9MpXafkm1vJ02Q86A3gtxG6K8ycq3bnzEnCDEPST1b9lLZ
	YpKIl3Vfh+/pO6MKdIP9l8a3Nx6Erds35gt89fLWI6/2qW3tIEFFkRWGCYnAWcTjGOsCcPyYh
X-Gm-Gg: AYBFou0cqZ5NbqALJyBqOeAZsx+qSPtJ5x0GPasElvVOPBw4Qjg6pKWGm/hDmHGrsU9
	qrpfBODoRsA9gl5OZYejUhSDMX4jiRNl3cmZnwfy/yVXIKgTM0dC/AGotglcPagBkzubxGjsnxy
	M3v0AAsZOEkO3NKeMXLVHIJ5VOHoSzPymgd8mh3HcbrfeGJHB/5O6XD2AIrp0HFOncrG3fu0ImD
	jGvV/OBcZeK4oZ8DHH6fFYxaokC9rVB0BNfwkY33hJxSntMZWJJxNgHkCkTSwGvSRhuDeE63gVo
	2qgXuLC9cqNdc+dOZ4fQ+3hO7PKzk1f/UB1w/KqjcYHmvvUW4cEoI1iSYNW94Z+/B2dsuWTcAAQ
	D8JkAXBPUijUfOHxMARydmd+yxw==
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id a92af1059eb24-16208be0009mr1524593c88.41.1791361679039;
        Wed, 07 Oct 2026 01:27:59 -0700 (PDT)
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id a92af1059eb24-16208be0009mr1524566c88.41.1791361678408;
        Wed, 07 Oct 2026 01:27:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167ef2e54sm4519079c88.10.2026.10.07.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:27:58 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:57:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Message-ID: <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX9GZZUXNY97ex
 zy/0lX0JBY2H5x/zs54H2e9XLCC7PUc05mDjQLkLtyjP+Kx21J+Lo8cv3L3FG4fwZhzNE7ruPi6
 6rVLaas1YqqG98rz54XT4D7KoA68ceA=
X-Proofpoint-GUID: tr6EFWhX8Olf_C4sXlJrX9NUSPN-FBLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfXwIknk0gLlQyV
 x4VJYb+gqC/WfqpduH65n0LotO0JXGCWOqffe+P9JE9RxQZHojPwz2aVG7M7lQxcS4NjvpZQGxt
 cOFmb9qLVhn/ZxB1V8qmqan0inV0SuJ513pPZYtln1DhnsP+t5mDSi5kjRat5iu4x2kIrgLuKec
 xhhZafjKfHCLVhK4Cj8cQwrAZkVobAvS+vsjdCc+g9v/xefYnE/iPAc4RvWzQ/GXwRaoI8lWLBP
 kSVy2OWG3no0WAADGgibJ4+oeZOWjjzNGAmTXBQf91TxthfBLbc8QE/sRX7m48B9vISIorbH/sr
 5ocjJSA3BnJjUw7zqfhWjRPKS2gcP741qkaBgQ11kk5j0ZwsDqtVAmqs2e797BbZ4IyUxQ+h62X
 s35jfs9yT8LayNqfOZ8dtkJF757tKkT0WRXUUicuQAKnd5GCiRCeb59TU2WFiadXeJTG8hMK4yR
 HRQp1L5raNJErvBFuYQ==
X-Proofpoint-ORIG-GUID: tr6EFWhX8Olf_C4sXlJrX9NUSPN-FBLH
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60290 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=v2SviNC_9pf3EYpT8dcA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070033

On Tue, Oct 06, 2026 at 03:56:07PM +0530, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

If it is possible to cover all the SoCs like Hawi wherever this issue is
there ?

-- 
-Mukesh Ojha
