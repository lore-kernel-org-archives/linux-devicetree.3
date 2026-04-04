Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59363537FF
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339792; cv=none; b=NLcjlhibPjOUkhLNS7m+h2+R62jW6je/5K+cJbbK9BL54t7xL+0OLJrnFMNbWBqG6VFq61KVNnVmTiLh6sRL3uEK6qSOvM+jJ6gozAT5bl32QfLc0wPr2uSXwXQctRjCkfaYgGbMigvHoieExgvnw6G+szmZvFwYAtFBbfKHvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339792; c=relaxed/simple;
	bh=b62OSHFpcjz1Ei4ofjanumrwYKdi5hKJWzoi2cvsCiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQtYjpH86kEwZeqaB5SFAM6c6+AtDki+/cFf18OwMvRpXg8kHF2ZCRJLC3oUTWBBKHroy1AMQCuDD78rkCjY1XDkDOoxp+ghNPGcacuC464CpPU0taKRpK+fSWbZbTI9SceRL4OH+rTHr50tCS5mj3tkpKQamNEngeXi8NQO4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpATHynp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/RPlTi0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpATHynp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/RPlTi0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342XgIB3989205
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NGMSDQdJuMlNNZWr6M+r+H+I
	QU1KOmisbC6o/fLIsiM=; b=NpATHynpDB8BqgBQvHtRn32wp6Nx8vR/xPFp9H4c
	4kj0W6hHBoEYKhYaFSem++lcw9s+KvX6CQP0zBdylCj5bgU9Sl+xRFwoe7uGPhRP
	PsbUisDDZF2QmH3ymBsJq2w9mnIE/1Y9I/0cdfkWKm7Rfp5KpgIl0TFTHzCabAqv
	8JEsufdbBENQ2AQatIpsn5ljF8lxmG3C3r1Kvghy9XmqDm/uc1thkw24WjPS5yof
	wRKXk2BFUA9q7M88wWLeWPj2VjOYVdOshTIkTkZ6D+3BQfxJvqAiXc2YZUNeMmNg
	V1f5Yp0uxuzJZJ43E5WuRF4KFLi+kTLYXE2ZDmIi3svHoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhmg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:56:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so53400851cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339789; x=1775944589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGMSDQdJuMlNNZWr6M+r+H+IQU1KOmisbC6o/fLIsiM=;
        b=W/RPlTi0xUxdJpEDHIsA9fegdE+MOlnslaOSSes0wajKchHU6zyynlhceVdHzq62De
         VWLQldSWoAbNvnO/a5w9v2/vt63aQlirUxihDtiPlYtusGQEdr9SBUVZLDErANd9HFR/
         gqzzfDrPKtcL5nS1IeD9MdwCy9ugdcmNl8p867Z/PwgOz7Xz3VQLiiNhbioH4ipFTuKf
         IKmR2QZILbDoyq8k89o67rJF50ag2jYSCq1Ow9bQVjxf1vWpLmxBwd8z8+FeJrDrrTW9
         R/2oI8djwvXNuh1mzhkULKE7nkKd4yleb8UcabGRMPLbPtjpGvfS/j8tUkT3kx8XyTJV
         9yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339789; x=1775944589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGMSDQdJuMlNNZWr6M+r+H+IQU1KOmisbC6o/fLIsiM=;
        b=G6zwYdHwX60Dxu2bLWa2jMox2JKIroe35pHfee2jLATdQ8//O+Cd4r96m7PJlCF0ZD
         zF0aiQo3cZY3TQVVlXM04zAW5uo2gICLJAK7ct476KnPAWZO3d1u6z4IGxHi67+Hzyr/
         WWdEs22uuvdWZagviJvwCsweXoMg9TXhA1c/oXHLwbfG2HQMECqKNMiadVjbBkFXiTRB
         A2gEAd3b+Q4slvrwEkM/Z7qIM0dMc4+KOadwMMOSx0a6ptVfAmZ+YsQTmVfgX4YyYtRa
         6gUJH8Kv/1QDeNoIVPaZv46JMRIZXXf20evCTyt25mL/VR6s7hhGj1tlhcC7cYhkoD27
         Vnuw==
X-Forwarded-Encrypted: i=1; AJvYcCUfN0EAjV4K4hV63Fk5c5ibaIWJod5muoW8wSzJNiqzDGllYxYpShLT69nnFVPkgTuOv4Ge/xofYdZ8@vger.kernel.org
X-Gm-Message-State: AOJu0YwAHezqIfQ6XNZMIKKxCzsgUoaJ0EtPBizPdfFu8wax3/xW29k6
	dDv53ymhHCxDWNfys1oMpSSKMltHH+y1z50w7MNQjx1LrH01L6jC93821v5vcsvUOgFy+O43/Na
	xB5SnO/CZna6NGKlIb4UlMr8qxL4m3Sp+AjYt6JIlqhUblspVnoM+G/VGo9miLT69
X-Gm-Gg: AeBDiev7D6H1tQG6goX2rqm9wxFq2DGfqcs2q1PcN+q8/LC3/K1XgpCRIQfspAeouVo
	eYorNghyJUH05dOFzOB4e85yOneU85qUXcr+SVVtETzy8GoXZHPu+jz9/mfK8XfbOj4XpTafTrp
	lLb+kds9O9vfnr77627o4mzL7jcECUxyVrMWVXylNyNpks2PFXjDT9eoF7MkoHBD0m4DawE1bLO
	5S3kccc1gIYqQMmC2JEBTE7FkucPjFUxmczXCUOHCuluz1oe/LkcwNn11fuBdAY7XAOf8Eai+bX
	mda/OZPN4xolaZtS4yglMxZNDcJPTXpnAxb79IWrmmeqVYWLQ+WGfxiEPiqADGiYcEng4sblKAn
	RzYo9y2/HdCYxD5KiSTDSiEcpvwzC5zH0EwGKPiZfaXQbPFKy/FrTwnfCmwIRR3hD+ZjfmSxc7x
	rLiFypB76G/NdbFozJSogjJolHM79oRvt93o0=
X-Received: by 2002:a05:622a:1a85:b0:509:144a:43bd with SMTP id d75a77b69052e-50d4fa36996mr128377421cf.3.1775339789213;
        Sat, 04 Apr 2026 14:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:509:144a:43bd with SMTP id d75a77b69052e-50d4fa36996mr128377191cf.3.1775339788772;
        Sat, 04 Apr 2026 14:56:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd6bfasm2297420e87.82.2026.04.04.14.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:56:27 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:56:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <kxqy224zsvmwzbuw7gxaeni6hxa4gyjej254xi44mtienew77a@5glf7k3xawtq>
References: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
 <20260402-hawi-spmi-v2-2-0bbe811fe3f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-hawi-spmi-v2-2-0bbe811fe3f4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX2Jm4/xilLFPy
 BrtL0p7UmtgHyAHaiFhZ3xWhcNzrY2Rk7bgnhUIqJoerPf+kQ7Ms6cEspu610GbpUcBgsZp0927
 FWdmmxAycjl/zFafJBlnP85LpZ6LvcThjPgndp5zE+aFpVFsl46SJY+uMhkNk9zAaI4D/fKNQut
 n160BF+r2bvixwa8hAL92oM3kMrV8ijTCJnVFGhevIirX6YmmW8l8DTr46Mkp9EgZOI9VOgVIfJ
 xAZHlbksyfvfUGY/j8n5qopxrGAnEkPk6p4KWPgFIKSSXGMjeV+n0RVMJesCkO6QXy8aOhtBgVv
 tP23AlsJyjfak+P/K84iJ8jpYtW0+ux4GngCbya3/FchhNYHWPBRcqI84xBLknNz1Kwepus38Ae
 EuXHAihfWdmQvzUdavySV+1JDaRQjxbxNSRa2ARbf+tVHwY2QkAEUT9WbE6BtOQNicCSivjciW6
 XEuvMDY/hqvMGvscXjQ==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d1890d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4h3_F-PqDEY_y8xvUNAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SHRn2FCggujoKE9g08D5PL53fH9mFwes
X-Proofpoint-GUID: SHRn2FCggujoKE9g08D5PL53fH9mFwes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040210

On Thu, Apr 02, 2026 at 05:55:12PM -0700, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 9 deletions(-)
> 

Please leave at least some time between replying to previous comments
and posting new series. Let's continue discussion in v1 first.

-- 
With best wishes
Dmitry
