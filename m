Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FD3CF666
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840776; cv=none; b=aeHaysLQK/0L80HJ5+rFC4YtafM8z9ml8d1L+9Z1r3t8p0HH+tkZMEbsYmO9FUR15Q8PQNPL/NA1oGN28Wr3LnblNu3JNakooHqKAL5HHzKWpLMFoPhyFSw6GQJirNuvfLm1aUwY4hQCVBf0oCr5YWjn66rdjWur0c8Vl2IvlaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840776; c=relaxed/simple;
	bh=QFtzC7b/1f6NP3+QfIo5lhUSru9B+PbuhuuSV9Omoys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mU1rBAdzFUEyTa6AdQlTWnp+CSa9UzJ4UNUKbOBEBurPqOBxqfkdjo2UDpHzVswSHmtNzmM4uJhbVuq+6FpA4glpNK2TOR1fm59/n25TtevJQldbQLooscC0E0nyOjjSjQOIJxaBU1PWfKb0Oa74lN9SxNi+ijc7VnOTg7oapHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XG6uQAbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+4DRbff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XG6uQAbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+4DRbff"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5WP7L3512945
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vk7VBeUZzwHE3tZsc8Y1s7QJ
	tuqy7pziC/VqL2N4MPg=; b=XG6uQAbTVNoUkjFp6sKqxJxlFxx5Ias4ao5X2tNQ
	VEX/vAcUJvsaYeHaKQhPfyowDr6ITxsGlrs7AAhM4bRsuWZcDNh9ATdyGphdsw7v
	5SbXFzoU6oUHVQLcIFMd3X4GbLE6/TcbTAV1IIzJEQVEGOF95o1PiZQcr/W/kSBx
	V6xuOnxQln5n/lgrzUSW29XRkWWuQ9o6wRTFuVttpk1kVZwu/nThqcJlhKGkqHM8
	qDQQO+Bkh20Dsm+wUVQN3lAbwP/RopWb44zq8roDoPCEDwJlVkQX2MkZPp5zQ91c
	mAXuc4O1kqla2PmuMfIUGNJQfhQYi5LsyzqnsUu8U2oT7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vatwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:26:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0e3ad6so19661231cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840773; x=1779445573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vk7VBeUZzwHE3tZsc8Y1s7QJtuqy7pziC/VqL2N4MPg=;
        b=P+4DRbffnN7Za4pDKYbJSAgFFTVO7IL7CPHgABe0hDGM01kOtDQmPk8l2UAFhPjNbR
         T48OY5q2WSV1Yit4QZ77/GO9n1BahuGTw+EHqm+r93B8CFxf36AEAOL/wO2sEi7KfNAX
         35qTVCdKodvJewjTUIqmxX9kW5MD5ZpBTX2Pmhkpokp1v2Qx3R8RKer5oeNu9wY74jXy
         OW/0K0f20zml6m06Lqpal+mvSgF31wnyIOY8vZLGv8pKieZn9cL9iN1TFiCoH3gE4q/2
         KfpT+orc8cILgKGrHQnnPknbeTVN++nUKTK862diJZb6VjZORWbVviqM7BIe238UKiVn
         uBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840773; x=1779445573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk7VBeUZzwHE3tZsc8Y1s7QJtuqy7pziC/VqL2N4MPg=;
        b=VJmWFgI1AihoGaaUTXY7cvX1OUxq8lXAJCp2suhpMA8mcOrkizqM38hghmRwHNjbrA
         QojcFrnNhlUD7bTTTxY1r3OlfqrCJ1qIZ/pgmACmd8y+IFFpitLprBlTr5PRoDTw0Njw
         9qNFwJdd85OMjAIO5PRirbCYj6jEx6SfmEQ4Ogu03au3dzpnMg2i4kjNFI+7z3U24U76
         kYPPwdSOtzjWsijPq8jF/Uo+Gl2QPLFpimvAxss2nq3jKjDFfb88ePlc0CmD2g+mutsJ
         4A0oayDSLqzVX1DP5pWqHR/0sOuVXlU6BwBa2y2F/CtTBY2s8e+EdelXsSCV6Y7J9Y0M
         ZZfg==
X-Forwarded-Encrypted: i=1; AFNElJ9S4TYGnSeyqHP2MtD1Hwo/UmkUsplfDkPxe4obnz+IPrq3n87DUmBSmM6OdZXeUSKoZzZuaP6GM0gY@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+WqEJeBkOK895AruVKamgE2ck9D7/ewG5DWT7sjK2MFSmmTe
	M01R5KwRiVqWY2up5WRoqDiAmfokBj2aPwmyroH/o8TaZdR6X76VDULKlJo3ihuGi0t3E6ScWde
	nVZYyZ8cUawZzfwVwpuSpHE/rU023jrRyTCdfaegLHJgI6t/oE3xuNMoKoNz1LP3r
X-Gm-Gg: Acq92OF3TsZJLnBfLemcmK1/fM1DfgJXA7vAaRHAuwVfiqLw/RKwG1jDRc/e4H3HAza
	0abbleFnIis+fI19nLKk0QbPa9InhyVvdhMhY5Mby1NbKiUzOiec2ZODdmo4hqSDiMcRy3wGiQP
	2smacS1jS6s2pEqs9XpdU5VKVCGbC62W6t2gnHTt+GhEuP3xVmKOO0wQXPEDsB867kCpe6cpCvm
	+J1SQabNkQ7hQR84ojskLQZ0KoFkZTdIxEcFuEb0I4l/VJo4bXR2UEvx6IXF7/pubY2pAS+pS+D
	e+3Ts/CLz/PvZ6nPJuN0RBX3jSZhA8CjWrHTNe7QKBRTfib7CKBggzt0hjqM8iAUou3TeV2Jm+T
	VaOykk5FUb61Y0y8ITFV/QxFfONxI8PpbUj1IYrX9OWOZdiUl+0WAqt0yOcnkNkropZFPno7rev
	2MhHn6gOXjA4rkWtrDetIUlc/NyMKevAO1ejM=
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr95751441cf.40.1778840773581;
        Fri, 15 May 2026 03:26:13 -0700 (PDT)
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr95751181cf.40.1778840773127;
        Fri, 15 May 2026 03:26:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8dc7afsm14595861fa.14.2026.05.15.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:26:12 -0700 (PDT)
Date: Fri, 15 May 2026 13:26:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add reg and clocks for
 QoS configuration
Message-ID: <r3r37hdua62lpt4xiahuhun5hgz6gtirmvwqo2ze5qaluw4kzo@7ikdv6kj3wxt>
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfX8vC4e9lbTEMl
 ohkc4o8kGHu3QQHQJ6GExPuuGBV5sNp12GNhQqx1OvFz73qa1sxIj6/R8twIQYm+IUd5iWVvv2B
 IMrVqsf8zIt3p1OQOC630fmDjBoihn8Ndv+SuJOZiNZ7pHSZ965LM4hxyDsgxKtUR7TxUhuAEEh
 8JtemiwebIpk7a3SoYlAmKuA66lyqBSgJWi+2v7WU76ly9b1/XLiNVkCvOE6psYcl+K2iOICKkj
 62LQQ/VE7w3Faxk6t4RyY95uG1VWcDhKVZ4R1wUliZnSQFctCjJv+4QyPzhhKJ6yR+d9AIQ5ptH
 tOEctVVV8p3BKXDBfO3LbGNjGsU3bXH6+TNn1DrLqYX6yY/5dfOOBkLyfZ0seFPbjQvMTJKh64K
 +tv+kDSx7zYtsEoJf6lrltHk8QA8vMoH9uWkz+ZxwiddpyTbZa8GV/eV+OTLbz3BEonY0KA+xft
 EajWV0Swh5704zWUfpg==
X-Proofpoint-GUID: wxTzmrRawEZt6FEnXeHxqi5hS1dsIKGL
X-Proofpoint-ORIG-GUID: wxTzmrRawEZt6FEnXeHxqi5hS1dsIKGL
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06f4c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=7vROA1eCcShV3ZceFmgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150105

On Thu, May 07, 2026 at 10:25:14PM +0800, Xilin Wu wrote:
> Add register ranges for the SC8280XP interconnect providers so the driver
> can program the NoC QoS registers.
> 
> Move the real NoC providers under soc@0, keep clk_virt and mc_virt as
> virtual top-level providers, and add the clocks required for QoS
> programming on aggre1_noc and aggre2_noc.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 157 ++++++++++++++++++++-------------
>  1 file changed, 97 insertions(+), 60 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
