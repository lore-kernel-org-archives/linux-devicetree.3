Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0E3F8ED8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499044; cv=none; b=qNDOcw+rkM/3qp5G+eXIi5Hc8FjMaUt54xBSEPNTf7T4fPkpo7Jv8A0GuCe2dKjvIMh5F7KuFjkTsiMDBoIQnqVmMfsaYW1XjTf5EJws+dRtGDhRTiyIDDaL+2wNzIEmCzZHPScUC8MzPdEVUqed7qzbJ4cZIUf9YGb4sCwoZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499044; c=relaxed/simple;
	bh=ZnB2FFOBQAnKdY5X0U5hfyBPVaTsPQG5cj8N5CJIEb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQsszj2juhYUL6qP7FLzVrITMnWbayU0v/WuK11iQbZP/xeOm81joWOaiy9Iexnt1OROyQqs4akDuvvb1MCftUa2v3Q0oo1LebidJgMbN++V0NGMLSHz8PcTXE2jkcIvdfX0Kiy8+Kk0IKk8ezplFzMSN0PVYwbdwgQDPtiI1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoMLCh3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/NW3GAm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoMLCh3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/NW3GAm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBctUf4185502
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDipCuRdQmTnMgrCpEz7aL9Ok5U27Xe86RdflVqnW1k=; b=MoMLCh3XGwuaSq8g
	jYNdWuFkRi7ZBLFMmxXW+ofa+YxhUSxplTKk+g/xXbcOdkSSQtjCbSSHk8v0wXcM
	w3e11oVIur61UIqkNK4XgRIIAXQRTa3wt5P3pVDbh8jxsK1mU1khgnyjJRKcNpzf
	KHjtXPQCrXRxMfO8ZiVkst3xTJLGKy1roOdQbBHtcAJY/BAmeLNmmkfNvGZmyTkD
	6hVSokkGViBF6hs+dKcaRvx4Tqld8ejuvi85PUhI4AoDO29+hRKQV8jAuKqVrR+J
	IPPJilPz/vSVOpB0kGGpPCw+/iyf+WeNg3XaGAHdxxe3z2g49BcRvN0VZg4h4QDe
	Nh2M3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru13024g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:57:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso8828241cf.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499039; x=1786103839; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDipCuRdQmTnMgrCpEz7aL9Ok5U27Xe86RdflVqnW1k=;
        b=b/NW3GAmZkVt9vLkAgLmkkrGbSxQdFAweGTFE1n8bnILOVpP1seJQL6Nsw62/5nygD
         0mCmNATYxerFNuQDG+akaPwH4SzPPQo/n6G7Z4G3YrEc6m0n/dcWHnmbnv6nAxnessuU
         xOcHCz0TXQesS5urLlh/Q2mtDDJd+2IOCjiw3yDJWrv7KAY2QnMyBuZW3ui4bEaTAZ24
         A88v/m8vURYjemVlatKMD3uNKxTVdC9MsNtD2rV2dRQD43Y0BptImMreqOsB2u3ZhC64
         fVODwMLap60nIlWvPn3mlDYLGMvVBytfMZnkMprtQw8LdPFHokI0e0053nn4DiFFbfUw
         +Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499039; x=1786103839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zDipCuRdQmTnMgrCpEz7aL9Ok5U27Xe86RdflVqnW1k=;
        b=luWghdJ0pafo/FjuleNIwdn0FK1vFrYc4K8v5QgJWXDnaQK4KzsNfXrmKSlGfmDpKi
         cuwv3DnGR0bDUm7t6CICYaSw7KnCHIAr44CP2Gf9m9GrafJy4DclHk9Hh9d1Q84561lE
         PTwBkiB/V9TX8fvoVoJnn6t2sFLYw4p2DL7q6AqgOX6aI6dC9eUEM9E1U8oPQwsTwgbg
         xdpX8Pq3WWg2/xg6e4oShOAiUC47Ixf3aBfSo8YUtEQxQ+rPCUqugopRcLSFQcuh3HC/
         tSHtKIN/OBcVDJ3Eg1i0y+jy16rD0tBx3KJ0aUFqmO7/cZcFSW8i4T7GrYG8xY0ZHzij
         RAGA==
X-Forwarded-Encrypted: i=1; AHgh+RqJRqbIWSHBXhT6p+FEBSh1K8i63iccfegaa1eWWSOkiPPKhWCDa97OPAcV6u9nMQhKKk8vI6UwlqUL@vger.kernel.org
X-Gm-Message-State: AOJu0YyiroHezt2gWJUBUEyTbu1r6f//hEy+XsHP8TOxYkg6Gq7DvHLH
	G0rkcwwK9lpoFy4GRHaJWkjP03UFGwEbWfzUrdVNTL4he1kSUi7iEFPgCoSNUA+UIT4gggOI7wv
	ysTnJRz2KAWN1LduQeZbAcYLD1Twf67dHERUYE6RFD0pNB0SgdmLJtlqHBEjXOa6V
X-Gm-Gg: AR+sD13KrUMVee2P5hizKtb5twqcd4gaFlPUAXRNvNun0Vz/gxqCJJghvwoM4q++aKw
	lM4LJ5/h/FbxGmks3P1xaVDfBrkLqOqpR1lma4jQUXO+49OkJ8njzsrpygkvs+TRvLiCxhOoHxd
	U8CHOZ+dIb0bRL2aYcW5eDIOSqyhXL5tBS/dhj/KyslwrHpkuqj3eoCJfrIfVDwWQqamRvK+/BX
	4rOYYdXTgYwycmFNys45fOK0sfYdsC0Dmz/hSyWLLJ76PatJBZo2kYXGcUVjCm6tTMa2HznNZhz
	zG/h3Ifovlj/R/WqqbL9m9S9saFQDchFH74fNCYD0fTezN0RfQ4pRajjVInbpKZg6FaWwRO0ZyQ
	YVOum60MI2smXIBWxqvv7fSRtn+8ie8lUy3ADbYj8TYDaitb5mk+TmAvW7d9vCYVbNxeKx0KGaS
	9lFyuQQ4hPBGsGjg==
X-Received: by 2002:a05:622a:4896:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b4b06032emr23454351cf.36.1785499039209;
        Fri, 31 Jul 2026 04:57:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4896:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b4b06032emr23453791cf.36.1785499038705;
        Fri, 31 Jul 2026 04:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbee2sm264238e87.29.2026.07.31.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:57:17 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX8riOGFbU22vg
 0PWmfuDUa7kHDfEvbaDwR/mg4sEAWyFgaoudqM+P/22Q70G3Mw33X9RjWe5r44D/j3SXkQ/ZC60
 q2h/NZseIzOCf9qEDO6VX/mPP6pO3N8=
X-Proofpoint-GUID: GNUiFmW7vLNkvgWPT9Hssh0EXKN7VAg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX6lLKGUZtXpqW
 yTv3irlyBsTQsEVjflVHl5Z+/QPQB2LQbpF90fBP++mq3+LLrLEqKDPl249iNSmAmb/ZW/GwA+S
 6S2cMxzfOSaAsKnMW67KDBHgKf2xeR04HSkNlibqrmatF+XeAA9HgztpgIIT9ry+8YuYc3BDrkv
 bV/VPUXcqhJhWtuEaB0fVMD5R/KGaqefKqXFaH4YT81SgQ9itTs4K42R6p5DFei5B3PwKM5Eg96
 SlYLz7A2OBs8w0RfnTaf9cc2GpF/kT/4fDerpzhxbzNES68PKy0HPUsGqxrA7QOSw3mEiDo+QQu
 f6dSlKvuJ4CYvhP/hk6SFpYHYYDGgdV0Zzv7jf4tmpv7s1RevNXPQdWIDjdbTOAHwy+B+779uNt
 EaUs6TvXfnxmPH7K7klZ4fVJRf+CEXd+asz3IpQ+1/9OGVUtFajr3s2xkcyEK078Dwnhf2piQ9E
 myutW04GmkqKiQ3RV3A==
X-Proofpoint-ORIG-GUID: GNUiFmW7vLNkvgWPT9Hssh0EXKN7VAg9
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6c8d9f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=rTYBJUTfbzVes0h8czsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310091

On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
> 
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.

This means that there are still two different streams, one for pixel and
one for non-pixel data. Stop using the mask and describe them
separately. One will go to the pixel node, another will go to the
non-pixel node. As you wrote, the hardware is the same as QCM2290, which
has two separate streams.

> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
> Common schema is updated to accommodate the iova restriction of 600MB.
> VPU restricts usage of 600MB for specific streams, which could otherwise
> lead to device crash.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

-- 
With best wishes
Dmitry
