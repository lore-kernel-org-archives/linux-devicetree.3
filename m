Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586B40587A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978043; cv=none; b=WIVgGtzcfsrmWYkG6Lo0W4dD6GaseG2Bmil7tMB4aZGoRq4zfDnx9Ce8cuYeh9ivZeB7KfI/QcRNBy/UMVsw10m1JDRGxGka94zp8zlhxliexN4x0hQVx4y6miEwvaufSBBZ29lxM/bU2sya02WEsS1o96nri2lTHNphzlEx93o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978043; c=relaxed/simple;
	bh=/o17aeQpgijRlxtzZDnQOtrwdMXAWUUf8iuyJjuFB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Amgzgzgq435+kv2o98EEL78HSfJFAqBoYK7VaWK+Cdwa+1o5BZ4ey1SBCOXfy5fBaLZx5pJ8bGzx4D+zTaRD+m1jYEqmpsB4jqEKRN9iZdigJlpbJHsz9z9k/LvANzKpfO4S1GoTXYzp188bP2eKKDh9V66jf5RpEc9sjP2gqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYtOC6JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aH4iKKCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYtOC6JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aH4iKKCk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F4gD957134
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ifhh8R7B3dmTfCmH1vu6b/0r
	66BrQwpPWHEDqb0z2p4=; b=YYtOC6JHoWQ8RkNZYeJWyDX9pHGrXKIbLQUHxy6I
	zIoLmL6NbBBIEk/LsUQfZWxk0vVb4LuJs+LOzvborzot6TUqLkZBc0u2aenWyNLq
	UjQTqiUa2c82g9RGSh28v6GJ18jV8WcRzS/ID1mNcSfGFs7cOv03dbLn2DXj7Fyj
	VQD305oEorgxHqafJ8SjgRJJOOcQfEUG62PgMIdi+JuRiiixYB679knjSZuRHs7R
	KdKeghEB4aAdRMzmJBfM4CLqYN9kaSH9AHGTFcPr2fRRvpazBiT8yDtLFQ2g9UqY
	LOyFeFwDTK8EcmXNShHOIXU7urEK/OBbEwLSklb0W1T22g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d06be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:07:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so583270485a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978040; x=1790582840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=aH4iKKCkzLDrvgJRGt7z0Ctm00nIywF36k4WYHCQK2UkevCqtLBMv7d/03jLkWyCRo
         W59kZUocgD8Tf3E/MdnBwocXF3Bc2ABhbI9G4rbNr76NpNdvL7kGHBOVy7WInON8jlnn
         xsP+qgACUV7MIB8fOdklOwvzJawR1jc2ZWDO5m99tN64pKCHjYpN7UkzZkxWcwl2IoPx
         La3jQE6HyR3J/DIq2Cjk+pWPIZ64AhHZKOPFl1r9w2rt7DHsS+JYeinP9RdVeNyO0PLs
         2K0Q9v3qzrogoceLVtKYb/Cb7nYcRUNE6L9oBu+2eezzDm4UuDaaB/Almr3c5yzBFrB9
         J84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978040; x=1790582840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=Y3ym2693R1pjSfeTPNJpiyNR+8/O0fIaIqb/OPIQWFb2IHNv2i82QcrXEtHXQnu2HG
         Ri47FhgLN9RBylayw5RxfJWfD9diiEOKmXIXcDNKTTZc9bCjDog/12pTb9ZNCv+7DOh4
         ANvn+yKf9FtdyT4w2qNO+im30kehI46XB73uXNC7LwbWHTI3yk9XPCLziCw2n1ntczXu
         fNAJ3edSZ/6YMpX4EW0g9VyufpZy5IsSXgPnaii8TSrT7/POSIVqKfSAw0GEW0ESg+Ny
         ST2oJWCYI8mUB/S6cSvkLZfBJdAcZrNnqHgB8RZOzTBH745DE4YQ+Q1aWLbt6txLZHOT
         oS2w==
X-Forwarded-Encrypted: i=1; AKwUvBxh2A4bempx2KoDI7BZl5zzZdpMeFIxj5QjY3pgkZ2YD+bB+eYzJqLS+XX9zqFCzIfuCYHUfPZY92DN@vger.kernel.org
X-Gm-Message-State: AFuF++k3vL2FipNehwn9YGX+2gnSSXHv72i21n5RvY1A6BLayMjlozUS
	+uLYQOy3yAftdd+UR7Wf5yIssQqYIQfAeDXSfp0xjPj7iAdhSB4hPHxRMGdoMI0xiwCRry39rUA
	P52hUZ+g52WU2ET6GliR6u7XtNyJ6kG6doGIdpbWQTVkPx8Z5OihuazQONfK5vlKY
X-Gm-Gg: AYBFou2y6prZD7euU0gHtytjCeuIFGPS2bhK/M0pIMwirDZ+SEkRqL52z2zWJm8BM24
	Vhkw2HdDfAL72UmAieDpINVeEXvH5lx5gYcb12xFBOTqsnE8w+KhUv9FLZ1q8pYMe7fsVCDK8qs
	K1KpYSYSlGGwbCfBYk/ezBHH/3jJ0TsokT2ZiK+uATs/hWWZV27OBIg/wbZql+t5rTIV3EkbIgm
	2Q8RywK7LnvZIo3EJz8Sl/3V+oFUJJGUM5pIoKZuYK6C8RAtgIN60sRV4XOkImraHCyry5vV5GN
	VGes6xSPqO4pg0ePdVg3FRmmgswCuAFjLsj8GaSLMOn1L4zwI7wJ9PedknqDEE9Tou/sfluPyLR
	CQ/eiNHfcokzkcsA=
X-Received: by 2002:a05:620a:708d:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93bf57b983emr836537785a.67.1789978039834;
        Mon, 21 Sep 2026 01:07:19 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93bf57b983emr836534185a.67.1789978039250;
        Mon, 21 Sep 2026 01:07:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd2bfe3dasm91475615e9.13.2026.09.21.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:18 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
Message-ID: <qecwr6lfb53fjjsrloakyhopeavi5c7bnskwuoyw3hviizp6me@fj2zhuxwphc3>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wsLvj5Sc8byykZC8GTMmPiKeaLQA04N3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX43Fvc9yezuqH
 fZEpxuIXbKJ4WUlnXobsYDrS0I6YuzHMDc00SDfdU3HdMD9d6qV/vEVXoRtqaHotIpR6Tqm6IP6
 5fRrLbdkJEBAakvwFepp3/zpJ4wnEvE=
X-Proofpoint-GUID: wsLvj5Sc8byykZC8GTMmPiKeaLQA04N3
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0e5b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX1N78Ux8uQ8le
 7RMj2Y+f8Af3srKOsUIR+TGdS1iXn/K/nSmRk3LcU5SjAifN6Noz1fJj3cSBbuIE2IVxy/fOehk
 gSJow2VJZkPz2hzDAOcZO1t0Ru+vDrxYGG1uMIbddojpmsQMAxq5XT7u96v3OfNCnXDHpUahrr/
 QqtX6iW1Hh/6ftKng1DMseMNEaLkNH63AI99869pY2K/zwiJczXN+AHgpl2Uat1EMTTL9mWMwTa
 9Z7Rx+5RFsfiE1SgZKeD6lez2Q8rg3Bxdpoe8DGZlDqt2T/nFtuvLq9UasxEAWaus3FPoOunXPu
 fQE2pOJLnK4POvtd8L7TnCfrPy8B3pm/+Nu2txVze6W7LRt/bmfcTT1FXCIYNi4VgGXnpLVEhaH
 V6CP1eN8Gp8outbauXq2bv9S9e8Cvxr1vyWaZCFx7JveDyyXPhbxJl9tfNU0++H+j/wsFcNu/bS
 8Oh9nmv80sSA+4Mwi9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 26-09-19 10:14:58, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
