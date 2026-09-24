Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21947207C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246310; cv=none; b=A6QHBYZjbUkZINSq8Q4TjgrAq53+K6NK8dvAY0QhzMX7PAo4XjejCFehL7bQ9LWnimpn1c3PEl6ftCbiZ6gmAP4F99rEjAQijMAqenYEQ1fwA1pWmitdCcAnb1iiH9IoGnWieIyRcC+EoF0Gburh4DQI6Y2YjRml+qWAwbVMucQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246310; c=relaxed/simple;
	bh=iRYgEa0QAMnnHBbeXblwmyNrfIIZOdOkl2Cx5CFRM0I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eoYXvbAsnDN1UgAIFySbS6XvmhTolYbVTOM+mT1Qjrv+mo0gxkcWfeQtFGCuatSsFIT7cN8T2S2uVtyadJ1BSSv+iRy759ldSbXbeXCx9nC6KhFoxBGbojS/DX6z7gXGrAzvsulJhtT3yzzNQA45L7bJw3a/Bg6I+9aNqFkknfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jvz+aEYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvBvxQtj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jvz+aEYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvBvxQtj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PmwP1644184
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=; b=Jvz+aEYXV7Apcmn+
	vkfNaEKwF0eu+xAlptFyaL/dkXTPeYDhmrqrZLuhpNAXELbL/lJgXsqlOi8zFTa4
	Q6/qou+pPsUxkWlb1zrNHBtOg+IZKhPqsTr7VgozrgFjRGOebms+0BhhUy3EFOcD
	yYT9yO/vd14VNxVoyZ0uJkkF0f2bI6CYtsPH8KlghzAhoqXbmC581JoG4aLU1M/S
	GZ28uDcLPkDcBh7SMfUxZQ84V4H5EzqkU0kSwH2kU+XWqGxTYsYLrf7FzoUDIwFE
	9ev5oRCIecUoWpi20Z0tcSHyDifoPLgy1JWCOUhmbTLN7ebQueJtmCus/XUcgyQK
	R6lILg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb3p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:38:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8696b921ac0so1528061b3a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246307; x=1790851107; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=NvBvxQtjKZmhMR1VLYUe0PHri0zSzVnfQ8aGzCL1HyTlEz+xJ+Wk9B3ow0ptfSEEHG
         Yz7163UWHHgOSR2WjotRi/way//KS59MdGc9tz9EYnFpkwNKMhF+QsSydlK8eBBHLMQP
         QamPE/Asg8RaEkA2irvhHq6sSw30hYM14n62qZkwAfQg+3941OzCCkdEOUJrijfsMcZ1
         o8KcWBV6ClvtZwpIk9xAEjftLzVl96D3kubSziPPt1UxpIrmdPxdcP/vjQcuo8Nwao3T
         qHc6S/QTAef6TCHEYpLZpA/ShZ0Ge2Dd64mTO2/HCvNvJkuuxRDTaRHZ5+aPAoN81dj+
         AQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246307; x=1790851107;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=qBl17ksSQ3BbSM614HFfOupNWu+oLygAtUbE04tZDOgffBoChijrN13MtXD+44YVie
         EgtHtusuu7Kf8v7EJu3NoqXapGf5DcNEUVjZBjfoqWY2e/v4V1XnFHluiGAVd1OC8mzN
         HEM1cj0txdYMrR8TWpIhmRbOeJsjvXETXZ/OOHEVYbHShWLnZ9wM6+nwEj7BfLDxesf5
         OzBtsjw8U1TFs1KRmJGD1x6t6Dri30ciTGD2qpPzUgu+uxEKo2ttazbtZJdLPo/KPVua
         FcxF7DW8ld9a0s7a8aIJSKDIJVD6TPDSXr3BD2/CuYf+93knPu3Fh26SzuE2z8P5bVQ8
         hKRg==
X-Forwarded-Encrypted: i=1; AKwUvBxi9pwKboo5JGpzzNt5RIHnd1/aKkstKCpFFf2IU6Aqr7AdO2DU+Grnlvfp5DRzfkl5+4Pipy0UZdpV@vger.kernel.org
X-Gm-Message-State: AFuF++mu9SLeJNtq4BBDbbS5nQxxcmuFFUeWw+ahyha/+l6MGpnjaFpl
	VQipR4wsXqdIvTDLAh2SskwXAthTVmPbOnPwVb7i2q+UtGlGIJ4H3VASEpW/W5Qb4HeThEjIzUs
	m2uWBQ3YLH5zL65Tjyeg808s//Zb33PeN5Z0VLkN7Qs41Oy842HKP+bt3WNHN6pX2
X-Gm-Gg: AYBFou2v9eTosVwp66J3UYBp7PNIZ/xZwvoQIp4SFrX02pitd65XlciQcXhLFV0ePTN
	6CYRQ+P+bXczqxzNylo+/06m4l3uHurRlGnFzH8qhJcH7BClTsHnxoqVtfM7MM7Z36zdxg+l/7Q
	5Y/rCsqxTfY2O7T4DybE4pDsV9HJhSMNdIMjv9bH7tww2ZqLIHNBJtmBU1+dOdFBjW5jSnvACb5
	wzFwC2LgEuzCAU5kqg9Kqh8ShJI47NVxj8HqJJIqJ1V9eR5p1J/aavsV53TCU7UCKYZeAYe8OMX
	XDah6aJTzzF8/WLMUSXAl8PdzXfb66gci6kIA5pMkwGV0wh6F0M22xX9
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904810637.22.1790246302092;
        Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904783637.22.1790246301600;
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2691132b3a.38.2026.09.24.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:38:17 -0400
Message-ID: <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9RhASdr27HEn
 Al2D0u2/KohKRAyIObloq5P7C+3aimgObZav5byQNBGeySd/HMWO3BnVcZ3q+jQ11tAaLzsNPpc
 uBcRQApEHX8FerVVYny/tWhGa7dRwIqPaU5gkIIQuKc1NU4J4Kj/SFcQNeUrnumvCUJoROzMIxj
 OmBNEEDqPlCbInryt0bDjc6w+LcNf1zGlYa+Pri+OiFBeahfQxdMolIyYi2ced0jYJ1oS/poWAs
 nvgFpN9iHown0QPKqKZUv8Ng7pMHA8crLckUR2VzuARXc8l9OJKdpshfMENNcuGhLdyCfrpBHRp
 ikRIa1yjxpHpMJFmg2IppD/kFo8x2//Q9PFCyigh4jQWZ9+i+jMHmcyFljxVviO24IuTsnfDRPt
 INzVYj1pnWkDh6EhEztLbL3VDpRVk+3DG8z7RcPfkWuD1MODV3Oh310v6FUpNNahYpZykVQwXmN
 cPt60SnaTBJc8ZChsCg==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fda3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=TMGBcqugHITK_y5VCRUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6oDgtcMGJSJW
 hwUeIF8FQdszrTSDHiYwEwdJWpx4gzz+zqEs0ZKDnfYB9aHmLwuzLiYYrjlYTLBkw7oR+e2Nuo8
 69p7rKOwpyPJv1XFy9g/FKoPo64yIpU=
X-Proofpoint-GUID: SeeWC8jodzsVqDGCV4HWgtbuPCrao_MZ
X-Proofpoint-ORIG-GUID: SeeWC8jodzsVqDGCV4HWgtbuPCrao_MZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Hi Heinrich,

On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
> On 9/20/26 09:18, Guodong Xu wrote:
>> [ ... ]
>>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>
> Hello Guodong,
>
> The RISC-V Unpriviledged ISA specification has this description of 
> extension B:
>
> "The B standard extension comprises instructions provided by the Zba, 
> Zbb, and Zbs extensions."
>
> __RISCV_ISA_EXT_SUPERSET would imply that something else but 
> riscv_b_exts is in B. But such an extra seems not to exist.
>
> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
> change may be needed to set extension B if riscv_b_exts is fulfilled.

Thanks for the review. Intentional, and the difference between the two
macros is whether the extension gets a bit of its own.

__RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
the name only sets the bits of its parts. That fits zk, zkn names, which
are shorthands with no identity of their own beyond the ISA string.

B is different: it is a single-letter standard extension with its own
misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
of exactly those single letters, so the kernel needs a bit for B itself.

A is declared the same way; with the spec defines A in the same words as
B. If I can take that as a precedence.

IMHO, "superset" in this table means "also sets these subset bits", not
"contains something extra".

Guodong
