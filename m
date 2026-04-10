Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA03D9DD6
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836646; cv=none; b=ZJh5pnrfsi4nhpaHlb+4ImnVLRlekK4lA1xMcBKIkWVuRaHWkmdB8R52ver3y7vISdDPIr0hjyXpWmh88Rpdow1jL8VpEbwvFKRyxRALsoXIQxMt9P46Yl6dYxM2wzqiQsdtpinF2Cau8KHOa7syOvQGM4g1qBKWnLYqwRwimaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836646; c=relaxed/simple;
	bh=qh9wtG50Yp48Ve5IdDl1scXXfBVhCvPgdjmlWGWHLRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDkoKSKDXs3ZBhLp/YRh2SIAZ6K4Quuv8u9E+cYfu0GBnEOcRQoZ5k5sQxOwXXK15WuN3V6kawCIL48RyE3/xDzFpR52ltE6U6/zCKOXsplHRik2WPxenudxQj4Mo/bE8rv/YKlOdV3ZeTx9nhRLf90yhK29ypgR2s4Ffkdm0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzGRHItn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR4OTJ5F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzGRHItn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR4OTJ5F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA5YbG1498584
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vt1fY/hZDTpSME7QkNrl2ujl
	DTe43Za3yhtgb4mp7bs=; b=fzGRHItnZik0H4frxR1Zbiw8DBTC2aLwTGj2Ix84
	QSoMcBViZQgEyBCzQkdfs6NZz1S1sob8trOsUkLRWzN4FE3oO/SMcfA8W4EBQPzw
	9+z0gUnjJnfZz2QjVWiXE3fdfIOnQyCn64ePPCL4prG5f4TDD3sfq/g0zjqZKm+V
	i/+zS15GsFtkn/Sok7SPZMjRz6hUfY2ewoziK2GTWFsOtsDbOnH4w1UO51K1m1kU
	V7w/Bmx/PQmCDOL//KJR7WrOAI7E/15ArCdfq07KGFT1ZyDjvVbHnJWq2KZcNcVj
	zje3Ydx+MWNGkp3Gs8othyFXl86AVX96rG8aFXqYbE7e7w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b119m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:57:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12711ec96fbso3163872c88.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836642; x=1776441442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt1fY/hZDTpSME7QkNrl2ujlDTe43Za3yhtgb4mp7bs=;
        b=JR4OTJ5FGx7hWbyqEOd37WjonN0xe2EDuTK+HdOQHuIiWUBONC8QWophb7WZSagXXx
         5WUwFVlrWXhFL8oWw57iaKrhSC8MjrzUD0nqwqnzHUvmiTko97Zj+bRjIJfaY++N1VE7
         pVsafosFlGBW2uqYKxsi3v3B7wZ7RxyPk0kt7D2z0PdQEny+J+mPOzxm7P3oSVDDadbJ
         pybTDcdBjg/Zlwj9CQxmTSQGDDGFSaOifyg4suin2AZcH0lpCLUJ6YIXixJ01yTLYARR
         3IibNAvr2hEf1F1tebEbyeVGcPurKSc8mordPls3JoAhP0MJDx5/hoxfzs1J7niRGyuD
         Z0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836642; x=1776441442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt1fY/hZDTpSME7QkNrl2ujlDTe43Za3yhtgb4mp7bs=;
        b=q89EfgQsopFU3KpY9GzT52HXiHC1f1XjK97MeH0VkFMickAad9yb7VsD+G4Ur2hYzX
         KXs+yOBOXG1OrRNwOFHTncPHN/9wx4EE2Luu08E/5ue8BBbmvmYKImxw55wWmOq2pxyY
         SyiwDh8YAfrSE/mn5fdJqza5c6oH2sBHYhuCyHnSeCQOAgIDTcfM5ucCkqrJ+600LRAk
         bMgr6xCwCrFozIhvqcqEj7ZMZ53/4VkN05hPN9NB5vrMRE55RXLDlikbaJJbqvCLPDAN
         lqlP6JDy3PpOFLdhS3eRX+ng4Z4eeOJR8jbbLNg55zw0xju/nioPPPBQcDGo5yVG9PTr
         eFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZULcYOfzw2kRBz6U2k2GdKGmJvo7TTX9qT/YVKZr5tcx7/vAu00ArPln9qQ0+Tawski/Y1/4VMDv7@vger.kernel.org
X-Gm-Message-State: AOJu0YzqaO8IyjkG7fdrUtlk0VXnmA2X2XDw9CE8CxUlnmDFq0Md6sYM
	Xqov2y5Cz2JA2x/S6+VAKbJbssf4swFhU7NSlgt1VmDM59SJ1xnQmHH0mzP0kNVMswnKFwpTL4E
	5vr6XbuG/k1Y6mVUQ3HWlyaqu2Ga4rOJYFLBad3DUtu8u8spOy59ejYxg7mQOc/Qh
X-Gm-Gg: AeBDieum4SY3uKMdApnBgCnqHbwRYixUi6oY5Lhh+2eCY4drUGSWnGRc61yA6oF+/5C
	6ZylS5I8ZsvG87ZS+EP2EEajPvNTfLThgLs3Yu/9cJlHu+4+xvIC89AceB5e/ErpxWULVhvNdML
	BYI/KExh8/CNVMYSw9dsrE5ksJVIbR4ovAJorYtMwlMnXyVFTH9tv5v29i9Flc2wA5gwLRLcIkC
	gQqx9h5q2vPSZAURlWamecEn05FVkBtJJyespLcQkZkEgdEOJax5YWrESm+R0TmE/SDXRurJZW0
	aVDGE3d31od/8ByVJdaPoNlWtkDDDA80VUH5IA0WtLlbSli4oTtB9nsVJsurt5SMCIlqO79epg4
	gZ/cHFOdP+0R0mOHIxJJei99FQjon3cRpW2ORLIB+3ANZ10x67R15F0PZnuovp3lrtd7AVxgYDZ
	Y=
X-Received: by 2002:a05:7022:ec07:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12c34efc9d9mr2249564c88.24.1775836642023;
        Fri, 10 Apr 2026 08:57:22 -0700 (PDT)
X-Received: by 2002:a05:7022:ec07:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12c34efc9d9mr2249533c88.24.1775836641456;
        Fri, 10 Apr 2026 08:57:21 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb031sm3733104c88.13.2026.04.10.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:57:21 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:57:19 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Message-ID: <adkd35ZFNvhCcTCc@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wczVMNOLsyNiI4mozs52A_AQyKfuTni8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX6K6vC6oLwT4m
 Klkfe4SfTovGyjPKSZdZyVrgBlkvEVNx+FyrWDxZmdCgqWAK28QYhM+VwYapjJoEMuu1LEKB7/G
 MsizxsZJsuSRvejlxcA4iPYkgWas1cXT13p6rlQE8p0oZas6AEI4+gHx+mNgxB9bldffA0O9UiS
 ohON8KhVYlxSefK1CArg/AbvQPSayizBc7CLJMUwTFu+Q01q56tHS12fBFHrU8T/0c1HiC8KxRm
 0tlBlMXq044C9+6iywn4uhUOUiX1giZwQHFFdec9aH546yZ2ZOhLe5+2T7frwWUedoo0EKRAHYZ
 +HXPHsY3+ZBtm0kYeznLJ+oGm2xMtZSVc2S4pPiBNfXU1+T8/v0LfwLUlURoaNcUJukA0C40uF/
 TBrGBYp0pr2eoK6iS0Q4R8Sx+Rs5cOQgRWM4whDosfj+OWnUTadd5u0ChBOcrP4WlWnOTlXdgKN
 SOebApcD+WBdTUbHFaA==
X-Proofpoint-GUID: wczVMNOLsyNiI4mozs52A_AQyKfuTni8
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d91de2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HxGML4-F7vsqb9dMjnkA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:39PM -0700, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |   7 ++
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
