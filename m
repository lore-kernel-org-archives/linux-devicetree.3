Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2BF421233
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006313; cv=none; b=kMSJ9tuR5Zhnxx/N0TsrPhO+MyZuwI2dBBLrJyrKG7LOGB1ymlO9PuP5TyiS8ggS5IGVtMbczswHcho/bK5GcAHO6W+dn3AsXxju1tVbazssUadzeuqjocURk4old2aqEkYUelnQxmTzuWfjfDH4go8NttrH3ZtiKoNj3o4mjPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006313; c=relaxed/simple;
	bh=QbxYReKrQs6OGh/asaTfb7InLjzlwDhN8Zb0dIA3wNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxO+VPA0ZaYDM4NfvpLu1/c5blTtQVFGDYTjV/cpezVp+bK4wwqj2n1rDjiRguYdC3Lsk7xubIApM0VW+kgLHaD6gZg/SfiV0QfbQnnq1sXJ0/q0SnBGYxFlkg6mRWGFHce1tx6SWQDx47P7NOS7RFbIy/XTmYdrrONY01INxY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCzfZvzz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaBayJgs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCzfZvzz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaBayJgs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767bhIp731557
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W+XMHQAvtIU17ecZnl8EGWY4
	1gVH1HAt7t3DXxrY2Rs=; b=kCzfZvzzd860lKnF7/6UyolUIiMaPEW7D1L6sApZ
	ef9uagVFuvZBB6077wIvsXGLPbMJUPQkMU+64XEi+tc/9VYt98f+M7QtPgAZhxj0
	xSPO2XFRJZt3DuAmv4TtO/v3n3Xon+0wyL57bmP0Qo2hPBmJI4kKsxAKDVD1HH3Q
	ooDLSmHL+kazckAZbDEdruxBO4gQIIlw9toDQkfEUo/EnqEc6eM7czDmYZ+F5Vue
	CJ7u0i1W5P1xFwk3yMZ7nh2lQZEgtCgJkkeYL/FbMdUNsae+ddhqlgiVueEJJjvz
	cP4waK5U6ACPj2VhRUaui1WKRM5cm0893cNQxZFKV01bbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk4jt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:51:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so20615361cf.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006307; x=1786611107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W+XMHQAvtIU17ecZnl8EGWY41gVH1HAt7t3DXxrY2Rs=;
        b=EaBayJgsan5vldgtScW4B4Z3XCwkr+JuILRGVyb63XgjYAhd8/llZIt6oO+FuRiCyY
         ZovNE+h7s/9NgZ8rKH11tQtyVShxCTch5ih/Ws67xXkwrIpiyPjKk7t/LrOtuUyuB1rj
         RZVs9GSBbgWtobG5kjKGK4GmRkvkhaTNyKDwXEBNogiIbiQNgBOlALGh09CFm3oyGgLM
         T/2+ghY2UKEiiqgd6lZQmYJsZ2nwIsSQO8cm+3O5r5ngP747fifNzQip6cJU37CoJA4o
         jtQsjjwJXck336i23Gf1mJ18BuyRYBI84odBcj6ghuAUtUXe9vdTOvwsBB+A5c27XYVr
         jZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006307; x=1786611107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+XMHQAvtIU17ecZnl8EGWY41gVH1HAt7t3DXxrY2Rs=;
        b=ZtHw9YnETwD0pLUwelDEw2SmleKbRibj3bPc49S5FYy7PXHyqz2CDJn8BLbNgitZaf
         dzj2SXFt1v4l5hEMAHuOOR8DD6wFQTMsZNqhS4iLsy3c4dUhW8ooLQwQ9qi7ShL6b/v4
         jfdFYtsSB36nj305+58lhHDnWBBGylxNuRMNve37ufMec0kLlHN1uczqhW+cpyq67Lff
         UuqxRv4Ksa8VcNVnfLtzRfOZQl8fWh7gEPep6pchWM3oJfMwuIVGKSTcdGhKIWpy6izz
         1kLc4xUqPlxNSBbHZfqnCz1p7plxNPDD/HstP4dZUDwEHKoIGKcLjDpMsz2te1eWsVZW
         +iVA==
X-Forwarded-Encrypted: i=1; AHgh+Roqb9aYDHsn51F0A3ON5DNO3HcBsnWkOwhYJF8MhBBg/GRABqlGiGYXcQ54TZ7n469ogc6g408EwIJt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf1QrgmUQ4mjR5yR/XYmFIgYW0mHzse5gUxKCk3ZNiVUtUGxDK
	6XICzoKjKK3k/qvvfXyqDyhiqf/DQtBbE2sn7OD0/8bazR5uSeL1tBzjgGkqh1huMFcLGIk/vKi
	RsHwT8BXDUiiFddAbf5tQlwiwxfcj3oeRk2mP1VfNrCrQfeyNLjQfwMf7JJ8o8ZJz
X-Gm-Gg: AR+sD13ubaHj5n7f6+5MZ6O6Ns0qaZAmanNiCTPtGNw0rsG1JPp224H2TH0Yl1IrbFh
	jv/HZ/Wdot4mvMyyJ25MI6CCQ76C9KBjre7cUrBmbjAMUMVsjlSwgNo275m9LoJgjKfu6nxMDGi
	/1m8PyHKSmH+nc+G3OWN3J3r2mSVZd+e+/V1/snviO8OgCIJNwpjrxewLP7eB/OueAa2yXsKEpC
	thqqdKcZphcChmxAFG6+A9KoICti67jrDfMYUz9r93scF1lN38C6IPFqLas1wXW5i7PTrIAW35/
	7KthnwMkJ5qokjMS7I9KjC38LykiH29y98YflOOTzRB2BurAO5FU65YTokoK7eRnbDJ7bptR7Te
	om9pUX5sRM7WHMfxr5VoR+vH9cstzZbGv6kectAxfNdWEWLA6R8aX13oeDSwpPPGrNT7C54uP92
	PEViVuehTYkoogsA==
X-Received: by 2002:a05:622a:c8c:b0:51c:19af:6341 with SMTP id d75a77b69052e-52ce61d2d25mr137690211cf.36.1786006306669;
        Thu, 06 Aug 2026 01:51:46 -0700 (PDT)
X-Received: by 2002:a05:622a:c8c:b0:51c:19af:6341 with SMTP id d75a77b69052e-52ce61d2d25mr137689901cf.36.1786006306256;
        Thu, 06 Aug 2026 01:51:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6236405sm598907e87.6.2026.08.06.01.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:51:44 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:51:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Daniel J Blueman <daniel@quora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 02/12] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
Message-ID: <mbmibfbkba35xdytj7ukreqku5jwwbvfwqll2yv2vhy4ebnaf6@ntlhflnfznea>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-2-da52b5228dbd@oss.qualcomm.com>
 <178553021128.1745605.17032924779293673178.robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178553021128.1745605.17032924779293673178.robh@kernel.org>
X-Proofpoint-ORIG-GUID: dLSIBe6xyoGotzGaLzuUxrSL5WSiVZ_R
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a744b23 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OCBTYWx0ZWRfX89POOCPUmp33
 UcGyp3aQ0cid2AO/1A+/xQJI4HrBojwP8vtZf+N5R4CaVUD9KtITY3y01XjLEjn+X9tFT4Zwpo2
 XD7X0lHS538Zk2chRg9iXPCbhhWwFjYLmUfFYK1GRixV+q+Z3XRG8oXMG/DVwiZNNT4r+bTfaKx
 b2Mya7pg1weg1FD4YXqgJB+nzx5MA0DkqTElIwMpZlyrWywYnCKpVddSNme8Q5d86vVDUsFTQCI
 tWMK949nNonqPftHltqQW58bPrhSpHEy8vf5k6oAFuP/YZMI1n//28haViSwCC4bmZ6CkjiQs/y
 KW40o8htZwIDdglFH21hj0iEWUH00p7iXGpWBYHQXYWLg7sAovvX/oOHxbt18r5oaXbLt88HE8i
 7cQntK6bBYNYSK0dUXlfks4weUL2RfifHAIdb/GUI1DKw/ZtWlfwJ1WtQL/G302dvTtczefpMSD
 ma0CNwjHcya7nnIrzlg==
X-Proofpoint-GUID: dLSIBe6xyoGotzGaLzuUxrSL5WSiVZ_R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OCBTYWx0ZWRfXxQrK47PVB5r4
 bEMmymZinNjPw+rA1NzUQrNGM3bH7NQ7x25PBWJRiu4UH7TQwUoZRjv+KeqRBIkIf9YhrUVkIiG
 7zzR5zgjiIAh4uC81Dp+2k7JjDyVgYI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060068

On Fri, Jul 31, 2026 at 03:36:51PM -0500, Rob Herring (Arm) wrote:
> On Fri, 31 Jul 2026 23:52:17 +0530, Vikash Garodia wrote:
> > The VPU issues DMA through several SMMU streams, and the hardware does
> > not give every stream the same addressable range. The non-pixel stream
> > is restricted to use 0-600MB of IOVA space, while the pixel stream can
> > address the full range:
> > 
> > Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Tested-by: Daniel J Blueman <daniel@quora.org>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/media/qcom,sm8550-iris.yaml    | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/qcom,sm8550-iris.example.dts:67.13-24: Warning (dma_ranges_format): /example-0/video-codec@aa00000:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /example-0 (1)
> Documentation/devicetree/bindings/media/qcom,sm8550-iris.example.dts:67.13-24: Warning (dma_ranges_format): /example-0/video-codec@aa00000:dma-ranges: empty "dma-ranges" property but its #size-cells (2) differs from /example-0 (1)

Vikash, you promised to verify the examples. What has happened?

Also, does it make any sense to you? The device in the example has
32-bit addressing, now you state that _subdevices_ have 64-bit
addressing. Why? How are those 64 bits mapped to the parent 32 bits?

> 
> doc reference errors (make refcheckdocs):
> 

-- 
With best wishes
Dmitry
