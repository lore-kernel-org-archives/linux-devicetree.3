Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E4D3382E5
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721784; cv=none; b=aIecd7GDmHdIloTL2hAoy8dsMGDQPW4E16fE7NtyB1oLVPai6pUz8d2Go3lXMPohkf94/g+NYuZFKpAHHBtYxC+3pwzYJFyABZCK5t/RKXuVEqKXKxjW9gilu0k6YwJh/qVzGPs6xztS3Ko36tG7ZOAZoDb/UxTTsi0MJYO1DUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721784; c=relaxed/simple;
	bh=kk2HsUfd1e5V5f/Uvg6ZYX2WSO5A6DZL/J4NAfHzS2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLfDKOFRrFv6RpjmJhXrD34kv85BNYANvMpaiRcZwqYfsR3wa4E7zdWn3B2eqppn6RNJ3qHJL/35ub6Nqif7TlGeHEyo7kWCFbuxWTlmIL9SvjpgGXBfK24fEl3SP1MjHWsJsWa62aLCh56eGyVNnheU1sKtqZWvc7NE6Dqayq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaitBNF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZskq6pJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaitBNF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZskq6pJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3H9GM3275587
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3PgkaJ6u5wDVRgfazpRB+APc
	TSKi8ppfUqNI8fCpwOg=; b=NaitBNF+25lqXbDEN8LTuygaS3c3dZCEoB1Em6Yw
	ybdeirmSl8kCHdpND8+Evrh2LmOJVlrRWLWzY9IzD6A11+Bc4zZpiWylp+w3KwaF
	DFCstnYoX4+E1IFwVrmYG8iPDXChC+l6ibmD9YJNfG+dlXThxc7CJ5f+NJf1rUQI
	rObIRVoeo/+wRo53hK11ZIuZc1PH99ZVwxeNdE0fdBodFdG4Wgc3NpDINI5P544/
	CQ9z3bVKl5Txb/ayFvvs9a9RAwOIAxPxhDeIK6EMZxOokugBeniFQkZyxAg3jbgc
	HMPcvrRBhPUKMCMH8+8n025Iq9GH0vupBBF7PKWSC+Go3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn253d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:23:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so6317141cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721782; x=1788326582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PgkaJ6u5wDVRgfazpRB+APcTSKi8ppfUqNI8fCpwOg=;
        b=RZskq6pJV5del69cERP81O5tZFTkZOgpuFEleVAAoLjY2Pb9wMi49rNZGJtJ8SlGAe
         DtgC+03qOrk3F9uDncJ5DJlKAJeqWyukCXDelpppk5shq5Y/4arhunryIhxDFDBwsgg0
         7mAdSe/5E8HuZdMuqW9VFIiee5moxWu947mR8WA7wOPpQKArx0gl/CGmx0eJNYtQPSMP
         vRB5P7dUib9Gvr0ugpLkLQEyGT7ayYX6+lhWbRa9ERMp4t/B1u38E/iRDW75ogPd5dcR
         5ElsTmaAP3pUkkJOpwp0JGo8tu8YpboJEJzl2asIhhkXyqXtwsLY+qxVHNUKIQbaqC0L
         QlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721782; x=1788326582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PgkaJ6u5wDVRgfazpRB+APcTSKi8ppfUqNI8fCpwOg=;
        b=hi67ZC7EiAhAoMTd4RvkDfsmjcoyueB+aq7p13JI78vDXwYoOefA47zz3XU/PZsu4s
         Q+plMyx/VqcY06wc2VZtbXBZEZ4zeBaLDVTwPCDxlhWigtg+uuRiYnWWzSBIyoegNLZu
         H7oGkkKxGCy+Hf/4BZJ1nMpHUymRkv5vM0K8aykILi/ZR+LGrNsWKLtazhqIbOHf07+X
         osuyihoxrAH2RtlSmDkKzWvDPjpJZVRgez/p+CW6r4CGfKK63dCkAZjEfTbYW6suP5xh
         +U5YEswvmp5QrgPRewIiP9Ne9mcCsqELVWuC0xwKhhO6Fl3N7JJ8UB0fi7TYQPJ+TZ52
         a/kw==
X-Forwarded-Encrypted: i=1; AHgh+RofuWtCXpELHgU3eMH61tGvScUXtv98YOaiaAZEDwVAW8eRlXJBB0BqV4JaKAjs5PloYCnFQkS1D+he@vger.kernel.org
X-Gm-Message-State: AFuF++kO4Ub/tDc+DysU2RWl0J9GJBBRo/mKmM3odyc9SKtFweL1E+uk
	4xaCy87KSm9jdrkd74UzmhgIVnD/WmxyqKyZRReIezOFb3oDaJtoqBeR/SYN60Zr3Pdu+syjr8u
	GX1OUMTEtvOkmL3WP5T05YfSinqgPUu9CdtmsjpxaWYpchwMiW2kNkfMN066DtHYu
X-Gm-Gg: AR+sD13v53iC1iTADuUEfiHlHi1JVmmXd4rx+j9GEzGhLXioBB8XRCLiYtT54w/e4sW
	eJLAxyayq9wPhhET+pJdxCa4wYgN/rGB6Ql0/AaYxC4NJCZbmp/H9Sow8ALnvGkBvHODfdi3gUD
	oL7rQjSmCeWNyYoa2UqVtzz1UUEX+qfauMT+d71ieub5IGFXB5FjwQMGegSc657d/q9MKL7e5u9
	jmMsn1ep/sk57Niyr8t2ecl75lxLoBrkBrRJbK/Bu4JpRJsEZEl5Y/T+0iJ+sHw6HWKGOSDW9lv
	ZP8KBEckYU+BDWkdJbz0iouQssEJ23RcA44SaRmgzoyBOC7T0FZTWGbFrFyAQOwU0QMO/Ib+IZ9
	c4PswZiGkAfTFGg==
X-Received: by 2002:a05:622a:230b:b0:51c:10aa:9cd with SMTP id d75a77b69052e-52e423bab97mr43141371cf.38.1787721781617;
        Tue, 25 Aug 2026 22:23:01 -0700 (PDT)
X-Received: by 2002:a05:622a:230b:b0:51c:10aa:9cd with SMTP id d75a77b69052e-52e423bab97mr43141101cf.38.1787721781088;
        Tue, 25 Aug 2026 22:23:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c251b7a9936sm142312266b.49.2026.08.25.22.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:23:00 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:22:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/6] arm64: dts: qcom: Add device tree for Nord
 GearVM variant
Message-ID: <bhn7vy5guuvazxeyzxkv3nhop3xbwaapcqbb74t42k25grgqox@auv7tcvyw323>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
 <20260826041200.528588-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826041200.528588-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: uAiOsvEyx23ejNJOVZiVcUkAtcbYtgRN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfXwdeYuykUPwsC
 9VGyVSr7HcKvXXr+AW6nceaZSX47sDFhfFDzfL1BkvJk725Bg76C0nFLP7A9BM813HCSDL403FU
 f92TuBTg3bkrnjR7K0foxhXtN77j2wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfXwsFsyXUSGlwt
 2EsBOnCBYRFz2a/3415kkrT0QWCfXRL+YAU6ti21eegNcVWHNUfzMaUBk92PRVWHvfD9e4jWmny
 /R6Uc97jHeM7A5ysT+cyS4+BxWH41s2mmAj4UAl3Hh8L09DD3TQmqsJpNRvNWO1n+yA930G5OCj
 qP7KXlTVvMwLLBmtWuFi5gwiY4Gy/uHGWTv1YGsSNadX1KrpyQ2jW85cphpchIjDBbWj0Ngw7KD
 jWYho7QgQvAfkjEp5eEzuoz38WoeoqTTkNGaBvOWbxX0suIqJXZ95gQFUeJnHrv3tqWvTotnX2G
 ttrxnCjVIRh8DAF6AWV2Ia2e5ov6OhoYRNeSYqWYY64eMyb7szPimtuZ5OFYm3LqpjS0Y8SF/3M
 ANtk3rhvFGimBdWRfznjGlJO15nxNGZCmMn26T/YcUynhhzmbHaFB+kWmT+5uHXwnRipITQnZeX
 cgHEdshz+hwsJnh8/zg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e7836 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0PVgGkzcavuvwKAl-bAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uAiOsvEyx23ejNJOVZiVcUkAtcbYtgRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260043

On 26-08-26 12:11:56, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add SoC-level device tree include for Nord GearVM variant, where a VM
> controls platform resources (clocks, regulators, powerdomains, etc.)
> as SCMI server. It currently covers:
> 
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
>    controllers using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
