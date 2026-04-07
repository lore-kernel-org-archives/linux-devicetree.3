Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859A1F192E
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554368; cv=none; b=IPzffM0WXB1VlaCwR+kDEXWkxqJQv4Q/FIHFZcW+KAUvCp8t2JC6KHpChAlKeFvNdqKuLczFmNkeTlUnCsFbPJZBLksJr37HZSoL/8ykfNbCHIZsvMPppKQzSxRC8+uNp/DlvF0cEKAm9wZvINnkBaq+mZDTFooPMw/0gHyjeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554368; c=relaxed/simple;
	bh=PlqtCBXD5lGG840CbvlldBm1Rc4lIpzRivGNmCMQE6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nqd7n87ga+AeOi+2iG7+qsgG4Gv68DW/g2ini6cQ5Bz0p6F6l7nIoL8PoS5968YxVz3iY8LcKiSRrM8iiDSmLTYooMdMUc+gBSRxh6DcrdlnQGDOUVrTKamlyesLjF7giHhrSaXA0qWs1mybtx/dFNQVp0h2me0imQgrISmLS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY0ExDQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDamxPyT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY0ExDQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDamxPyT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6375xf7P3404395
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjQY31qiYnxDh7nce3yeQEC/gszOekVbPar7JZhOSNc=; b=dY0ExDQJHCQbZ8u7
	3JbI2o9kSMtRvT7cBgvx8NYRYEggCLaDoMKUg7s/yGDITbJBBdNBABTHB7fhT123
	7kjMR67LzfFbGXBmSJ0pY27Kt0ofTLTAEbI9iirdzcnL3Z/vnmMJM71VheUytde2
	lRGoLB1L/cJf79mN1gP9g1uv1z4UlWQPqqQtgsHZxi08ZOK4uDctI9iL/MkxnYeF
	j1wCCrgJlyvc0g9viXa5/1uEqdO2jBG3dbH1Wy3RgtgoVRc1xwSg8DMZwyw6bHCk
	5tXkJ9p3+Q0sDI1lVOXpcljCq8KMkSg/EzQcXkTN6OP80MHJTQ0dnplefnX95FXf
	eOe0Tw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrht234-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:32:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso18124421cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554364; x=1776159164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjQY31qiYnxDh7nce3yeQEC/gszOekVbPar7JZhOSNc=;
        b=EDamxPyTrYYtts6eHRWDXIJ7J/sVcGfVJyh+vA7W1kBHljcF/TW7aj2C3TkUnvv9uh
         QOWljxRo+bw4QTWHuVS8gH3HhYkQ+qzM5O51qrezkP1TQhVKcMzrjcgKbx+lEaI525tK
         iNVz87uyfTt1jcHNOOovQBHrFUNZuUKVOkpP2G+pbCKb7dgLFWsycV5DGzBGF+AQQIKV
         LiA5AAf7elgrKcwUlKaXs35SMb9S4XpcAg5qFoLcCBkkEhaVPTOLjDI/El+8zmM0Wp87
         EwK6V7PDTIHDtV787c1SX9Syqd5h/3i8xcyx837BbAT+TX6hT8JkrF45pmi/ynzh7I5f
         52Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554364; x=1776159164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjQY31qiYnxDh7nce3yeQEC/gszOekVbPar7JZhOSNc=;
        b=dIzpnfk4y4vuqpTT+LByDM/qj9OruOFCeKs7zfS8K0ZDj5DMWzPDr6oiBoiwPh260G
         3m0qRPgrvxSr2W1IXRJVSn30k9aUikpxdj/izcWykGGFv49jpPIBTXrkZJ9zlVArM/ht
         bWNeWbuLal9CzIgd16RXzRcOKrCZJ//jKMifGrymipHKFiGKEbUpr1+uG41BtyxzCgGj
         i7TXU86U+zFPwMNeOQiwiAcV+ZBMgradS10U/KbKrl0qkFVXpL5yb9HWYXOpi3Ulnf9w
         4h/L5U2rQCzHyWXV+xbm5wtoeJCFfUIzHo+WRr4CZ4/lect6UVi5R7hK+Xx9gt/KSadU
         loJg==
X-Forwarded-Encrypted: i=1; AJvYcCXKQbFJJ+j2qqbWAlKbOwqwAn/qtgHibSPXifZRzRCj6irwqLypHuuuPhv+gEpelBhu06k2b6JnzppI@vger.kernel.org
X-Gm-Message-State: AOJu0YwJMOhjHhKkdGVz17CEpUB3XiQVsEm2Fn1hdtz6tOca+bdllSNi
	g6c41qs5krB56ZvfST3/9ViPqo1lV0J0GRTtVSpep64a1njcQrFiRZ3xJ84CygnC7wtC8vyWlbw
	lr19T77/4ehKPNns4BZ8oe/tuCzksXT3wXJ9AasPjHd52bv7pBOAABJyPl0Hii5dT
X-Gm-Gg: AeBDiesNhnkr4Sk3KqS2wTayf0DLk9duhOBZwtYJ9aOzPxhsDw5XyxKWw7ewUBBztFV
	oP91npPG27+hML1s5fbYfnMJE5nbVtLX/XDJllw8YuHnrCVPBFLio7+eWsg6+2tMa9xHOMG/bdN
	JbH9UYduZpas2Hog8ZGMQa91vACb2/udiN+l1v19PXJqQHnNAz8mefmv7Xl+SuY50VDGqzvcp+n
	HlCk+hVWI6VmqNMOSdkH1BuVx0xtELVvOIQ2w8lblhLLZZ2waswMNZmTIUCfhU5fok8TxTrEiba
	+L1rH9Up2xiSlZDaNUqkYSFqUwVD1NF3hIaOdFqH3bpNTW3XQg4PZNF39J5dtLEkPQrT/Vxx+Gj
	jKpoV+SlknlIJ/Ca/+/oF8pN67eiif71FRG7IaGISvO8pX3Ue6+DuTdrvwz1NJ1vmbiPkbFjZK8
	4ucQA=
X-Received: by 2002:a05:622a:53c9:b0:509:219f:8e34 with SMTP id d75a77b69052e-50d6260ae67mr176221051cf.0.1775554364455;
        Tue, 07 Apr 2026 02:32:44 -0700 (PDT)
X-Received: by 2002:a05:622a:53c9:b0:509:219f:8e34 with SMTP id d75a77b69052e-50d6260ae67mr176220851cf.0.1775554363979;
        Tue, 07 Apr 2026 02:32:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm548707266b.21.2026.04.07.02.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:32:43 -0700 (PDT)
Message-ID: <18f146bf-155a-4266-9f31-b75962ed1724@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:32:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX057ctF8mm1pM
 Og6dM3Q5yiNTjGQQaGfip0C6AkGvBmf/5bb+UU6MJe8bLVkm+GPtTKxg2D+Rt37GT/GQgTnnn4C
 LasAH/W+vgq849owx8NENDV+4OldJZYEoVXj7bHGhheR7RC5/u4AJmS33j5K/67eMg7UkfYC3h4
 9PPIYmjvW0qasPGkLga8zw38Tbmo/bB7UzPxTE5vx69buGlCAUyHF5559/lM4nnCRWtl7Dfog7l
 cZezaMFYrwwBOrI3sf2qrV9RbQHYwh3npSD50Lni0K13Dsi8hYXNZHpf9J85z1RmUpsmI3IrJW6
 pMztjTndJ3OZ1E3If6MCRpOPvEhHei/bXAk2FItMcQ9ZKMkdPP41kRAVEz2Oa3MI4/CsWTdDDVt
 xdC9TePneydE5hQ2hP6NEuOk2zOZETBMgjUWiJRqHb7hjTxlij3ZlQPx+4DrMudTehyod9YDyEq
 iD4YSOYnI781bOE6e3g==
X-Proofpoint-GUID: hMjv1nnZOpEXH9b6CeTOPm2KzY-CIRgT
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4cf3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=edOAiv4QBLOMXHKBau0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hMjv1nnZOpEXH9b6CeTOPm2KzY-CIRgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070087

On 4/6/26 7:46 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
