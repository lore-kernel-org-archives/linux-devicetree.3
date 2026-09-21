Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321E830DD30
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956699; cv=none; b=pdRD846BuSadwY15/nx4TvWGM8ztocsODe3zJXzCtt/RHqtSYwL7sXb1Gwx69dpK9V8sB+AYlHCE5wViv/mgALjZW9wdYe37jdIhaNANNO6MZkYxEi/+9+lMSdnISUBF0+XtCZbkcgO3hKGRBx8NLUQA/8+CqV3edsfck+khEgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956699; c=relaxed/simple;
	bh=P508dyZlNxnQF5WAm/uJjtwcwhNhiFXcwVZ8Co6jZ0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zlo/cUTySSgsv1ELH2WetVRGDkX7OYcJV2w5SAF1dWaiSsTWG2DhnlKoKWsP1J2A2PFi+q8SnK83sdqC9Y2hfLYAUMlsfCGhqaG8lmWg5JoNNgT3yms1V2UaqK2db/r2Rhovo3tVeRzhoh0mqQg1U/YeoY3iwxMKngTXzw0t88s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKdamC3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSueK/x9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKdamC3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSueK/x9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L0kibv130838
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hM+afzleg+Y6BVDw/uZ5WTic
	usaH9+vbIS29jpUbVFk=; b=iKdamC3e7Z5Ok0rU/yE3Gcz9YN9ioYDwJDyJKH6O
	4RGb0vdbA3Mk+aOW6GCc4XZycHeFiUNMukU7VShE9hL2qS3DVFe4QnWY/CtfUGBw
	dcqdONTgZFgTDwW+4/U16KBAghmdZKY/mDzGc/CDM4xEf9NBQn0QtxKaSpt4Yc95
	fZ0rY/CglybYJjvjfKYFReZgFZHzwyxmjrr51S716Nt2OJ2WJ+X/Ton4R2qg9Zni
	FM+WLwzSOfXAeIiPkb7loYsy2AuUelCwi98B22y1jkl2og4tyeImthF1Pzgq9JKl
	hfdRJhrCrrSKGKafK+5kRMYDv6h4fdjovtWS36TUFEMO4g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j8ft5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:11:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3601141a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 19:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789956696; x=1790561496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hM+afzleg+Y6BVDw/uZ5WTicusaH9+vbIS29jpUbVFk=;
        b=JSueK/x9MENMcdH8IRjklBwFmjFQ8kBvnEUvfjCHPdXeXTCZr5u0MCtT0eyeKIErRc
         vejm5H2eUurXJEdFRzPaLgsFURyx5z8hbRaJKocFC2pF2//YIYLFpTwUCCxTcZCIuAWj
         ShaEBoThGsMYe+W3iFeGqPwaTMBdT4hnLxnsdL+/Ft5qYtFGzRCHfTD13hOYUittqQXE
         JO8EzyIJnhsEHMHfXZtZT+g5JqKQKux5gMymshQ3crIynP1l9LjU+uylzRYDIp47MMvs
         B3CpNdyJZv8lqLkwuTynz/EiSA930HcjBihAh/Qfsg6FOQQ+X7UmA7EGosiaJMuIyS6J
         52HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956696; x=1790561496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hM+afzleg+Y6BVDw/uZ5WTicusaH9+vbIS29jpUbVFk=;
        b=wVxshcaKUFIvt1J4wPqU5Y7R5ZXWNIv1WEjHyBAHkFkG8ErFvTbwfHQQCsyJdY1k97
         F2GODFiiCbfVtOtCTqvV8llSctOLP8NiobcdQINOgvZH9RaJpQKmCDCusV1XHSxs5N8Z
         ekOD8kkFZq+wafIRa+kokbIbUpPkh57iNfh3cbbR0NH+as2koTWXkY/Nu7+jQ96KQNLl
         T/cqYCqo8Ch2Lj/gsZl/ggkDymb6LCNjTxuo2Op59sVtwFs9XageGPCyrEfFBsL8VdbT
         HEHzcPQ6cFLyeW/pNT33Yc0u7mg7yL1MFhcCUjkFgtNjGElODxPP9J5YeZJR36ZoNqT4
         gwCg==
X-Forwarded-Encrypted: i=1; AKwUvBxAxyCkAly3eU8y0uxUk78yb+kiMJdIn5rZrlhxdImcpYm2cp1FOero6DDlpPCogGQyJMgbzMgGXgIz@vger.kernel.org
X-Gm-Message-State: AFuF++l3f1j0LzjEdqTswx2I6ckc8Sfec3SJgDtdinBWhkUsokvjq0W/
	95lJDw3EFTO+GD3uuO5slGDDRQ3TgK7WPkaSeNQmMo4H+3AODx7xbycQUeTaiY8GsIEQ0Xaih7X
	vhjsCNAIceoTJ5RmVq/8+l7NQf2XISm7sBhAFMVTfNjSF+8gRYImd2YRJFU9kk6jp
X-Gm-Gg: AYBFou1db//BuWTGWoWoEPqggMiXIbucx/Jw8YksyW0/cq5ncP/Er8vxaEuehCKKSbG
	oe3qLxHVLdBHum/qdyRDur7gzmKOMSGq4vOmVcH5QrHpb809s/szXDXQ51xpOTn2doVqpi/9iZE
	/cZdsHXmpPrj4QN3oEffcKqR1jzwnf3fCg1+YK7NQO0ChAngUiGPA8nVkutXA2fs/+EeqGIzWRR
	Zdg//7nbjH+BKUwbhEeTubCeMqJID/r9VMYE6i+LTqqVl9ieh62X0aEX6WdMTDhRJ5PoBF7W+Ye
	w71cswr4MY2kHgbnnMqgOG1Ea/Hy0MdPxLTCLC31216zVGsQ3WwPLk6GhJ9djdilSVNr61/gFry
	TeBtrWE9XS0QkkfkeRtH+eK/Eyo5jC/Jnw0sxbkHdvPU=
X-Received: by 2002:a05:6a20:918f:b0:3dd:a197:cf25 with SMTP id adf61e73a8af0-3dda197d826mr8301453637.73.1789956696099;
        Sun, 20 Sep 2026 19:11:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:918f:b0:3dd:a197:cf25 with SMTP id adf61e73a8af0-3dda197d826mr8301432637.73.1789956695660;
        Sun, 20 Sep 2026 19:11:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e16a7f71sm5565055c88.8.2026.09.20.19.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:11:35 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:11:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <arCSUfdtKPB4eedm@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
 <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y>
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab09259 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=j--DFvPhMHtmlsMSmk8A:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDAyOCBTYWx0ZWRfX8eWbpYCVxKaJ
 wsxojodefBnMHC6w0ierOInEWmyEjCEmM9NIzhNAepzT5b9mmlfwkqZ4Vf7MBnoxp33XKTj5GzA
 smZ4FesTf2KB0ruOR+z6dFidCTXSIGM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDAyOCBTYWx0ZWRfX18LgW9vrZ62Y
 +7vHGjtiu9MXMP5Eqm52biq+r5oQRt9GlYmU5v4AYn8/UpoDumixbIUxBOG/a3onVkAXdsFdDtD
 uJxbd+k/41yIS4iqB1o4LF2rEi2aNNOfFumZtf/eXG5g8FYp4ntjQRgcHxpGTdTJu2mThVnVkoB
 qWLWs+FGvaAzWk7OdrN+FHuu2FJHa0Bq9uJv9Deuy5NuX6enZjlj38PbAEx+fncKirLBMwb9V5y
 zEfUxuwSbr5DMIDpGsdec01OiUbcf9m+8pRo5XFXrX1ZaU7Sx7Vwk5eRefRAyH5dN1rqxU2A42z
 1kL3OCSTDgAVwb5891RJuxka6Zh7vYSwZ1rvOvA6Le5IfD8TriVsxywA0Sc8fsWA9ahI3rQC46l
 a7gsAgjmg/Rtk2BjJmgWaCfEb1gkilaaOSPQ9icfyIpyyWu9Iq1G6kSTGYDCbR2KAj/IUEVhXsx
 RPuT9FQbG9jJ5C70btw==
X-Proofpoint-ORIG-GUID: iG_YYekBdf0R7AukZ3xrwj8awmvUWLAo
X-Proofpoint-GUID: iG_YYekBdf0R7AukZ3xrwj8awmvUWLAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210028

On Thu, Sep 17, 2026 at 11:00:36AM +0800, Shawn Guo wrote:
> On Wed, Sep 16, 2026 at 05:55:37PM +0200, Bartosz Golaszewski wrote:
> > Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> > nodes.
> 
> As the nord base dts series hasn't been applied, we need to call out the
> dependency in the cover letter.

This comment is not valid any more, as Bjorn just applied the Nord base
DTS series.

But I just found that CHECK_DTBS of qcom/nord-rrd.dtb is not clean.

arch/arm64/boot/dts/qcom/nord-rrd.dtb: dma-controller@800000 (qcom,nord-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
        ['qcom,nord-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long

Shawn
