Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45B40800D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339681; cv=none; b=GU4Jxjeo9KPWFg7hivNuB3YXD6+kdEkDkbz7xqlu1yeCrqMqF2ql9bC3LA1TXyfFnW13BKNCb96HVbe3S2yjjdnvjHA92DU65D53RYbgIwXV68+PGgpizdbnYc+YEiLFwvkYU1ZMxy4b/4P2Bi1S0Y56NAZxJP7+lzdfEPvmwlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339681; c=relaxed/simple;
	bh=Atq4pB3YGZ4lFAEE0+lnM2Mik4PShDbyqyPa7jARmoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMqC7zz5P48qJpgxED7dlzp2e3lJwwKhVweHsgarJlPDeWpId3loBb9mx5zCVQeW+KLxuzHe63OfuRpHC5VEhpGFWeN5ECSR/hmHsOHrEO4nazT4MyhpNKsPivMSSX4TtpvmUKB+0ZdahdnU9QvJJ3JNar3GySCOF83WCYjLgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0CDjcU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ4AsGlU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0CDjcU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ4AsGlU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VaAA1859347
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 09:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQbyCK8hb1C0dq/eCYljQc9X
	nj9duFCu694HFTDiHCc=; b=G0CDjcU0Z33uC/+1pPkUPpTkEdsh6cwkhIIBDNuG
	m5bnV9QrSeZxZM7sO0qUxMrZ5mwBp3IlzLTyttKxaW3xa9aYCD3PmoNLEtziQPh3
	BEgDf3lwo5HG8kNtSiT6VXudYGieSg8GURzkWnrPaJu7P9EI8AigTdUf/ViUDeG/
	WZLdSBjlEg8rLS78DWPLsb4jPJAkkSlic5ld2IFdaVtH4WuvDNDj2v18DxwaGVfn
	wMx8+/Xqj1HxCV/io9qcG32g9ZCkdV1mhWuwDnqcGqodXUTfLrTeA+64UItad1g0
	lptcR9pbVPxbnoaYgnPyZnYnjNSLB6JAh+Kd2fmItWrPZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whhqb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:01:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso145068085a.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 02:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339678; x=1788944478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=EJ4AsGlUe9vZmEtfTTPB0daXdNVbiFGpGjyCdHatQHKs/kOGtgHDeeSun6G9o7+hXg
         BB1uxUS+QufBP3clMfqeXCF4ZsyZRPP+msozEKcm+ewcETaSuEowdIn0TZUG3DD5cPxr
         Zafxw8c1nqcBE0402AT7V3ir0NJQOylSgXWsvQb3cD3vGGFPzfukCcf6FtvLFMN+vvsl
         QTGPA53ni0LhyxaJuGFW2xiLytKq3ucSU8dDf9WQZarC55/pOEndKBtyhh3VCZaVJary
         KlRdXwplnizQ5plt156I+8X84LQxcnB0f4DtCOG/zbbTvbe/DcbZkBGO2cyurKT8CzB8
         CGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339678; x=1788944478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=kN6MOfTfnKsaOKudkEtdc1MVFCtR0qOSOMR7QqbIIUhJWzT3HjkPLDKmbk9y9k0Pu4
         YFljkNIyCDYu5KsHV7mQ0hKHiARrAiF2EKHT8fPV2m93PgjMqxZnHEmwGpX1YXkA0nQ1
         wqGUZUwaGuJIpten0tSP0O1ubeLQr6kfsS2z9JyeE/oHLewrREO2co2dGFQ+9KetoCYq
         Ne0gtX+EwGgMir9QWWWX4DQBDsNhW1tPTu7Db4GrZMkVVnacNh3ol28x0ZTU83cWfT+A
         c+ZjDF064hJxyWp0enlXE3cIhDV+eXPOeJImgyJiTLEL0xHglxrC5lB9Lob6peKXNnj+
         bz2w==
X-Forwarded-Encrypted: i=1; AHgh+RpDwJIqkbD8oqGHxZHuEZvQF8iejnW4RJ9rVzU6wr3eot4+2HIJIvk23/FtZA0gjQ0oLgNJuvo5YK72@vger.kernel.org
X-Gm-Message-State: AFuF++m5k+c/R/AHTM6a0VAZjmNpAznuTdiv8Hr8ZdMMlURe1wNzZe5F
	XuxrHtSfRJWmtTZq+aWMXe4rjHLcX6Z07mcou09I4Ep4R2+nPk6/cZFpFHyzbizkaDzErjYzrvk
	EVrwBkzILCAMFgMlicE1sFOkFiLxZqol21XdUbr4QZAa6uGOUuagWFCo1TOovHQ5i
X-Gm-Gg: AR+sD11XldTQ/MRgC2jSVAwkeZqZFxfLr+u4qK3egKlFBKiRvsxhO8vdTMjkxyFMi8y
	uMEToQG8CofTk/+juz5lrEPVqhkEO5RRzXFCwi7DuZj6k6IrZd0B1iNmxDg3bPipJxNzb7rRTH9
	vBjLmEJvcw1wr8NqwcsgyU3d0VI4U73fr1xTH29R3EH2a1kXTCfoHYymB76hTNxtJBCQv4LCL4b
	/Pu1pzX6EWZFRa6K9jYC2LyqGz8S+6LAeuRefFlq4rJ0rH/KapBf9sBFmWILzjvNYSaQGUZ8WPP
	K2JuZ0RfBpkldfoyUXplBNNsqp8KLoKg4h/W7lb4Dsy+rPcWPgwsfeboi926U81rWRCkn0bf5Xa
	K02nRD7EGd6m3mw==
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141499385a.9.1788339678437;
        Wed, 02 Sep 2026 02:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141490185a.9.1788339677868;
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm155172055e9.15.2026.09.02.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:01:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] regulator: qcom-rpmh: Add supply names for PM6350
Message-ID: <yhbjhnmuwwqqbjlhpo4ppwtmehxnkiuqagzigf2nieqxqpiako@c4tfpqbizd2w>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97e5df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=siMggkYB9rnzUccrDQUA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: rJRblen5lbijanxkK8kt6DG0EYJBfZKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX+agi6/NzpQ+c
 eBg7tcJamIZbLIXCWHmCh+jiI6JC+d0DnJ22qwy0i6Rqf8WHRFTVboaTive1rWqGM6IQ5ug6ejj
 LVRZwYUZ2gFALuDzjeG5S1Nl1lP7DJCosMp/KbzzsGyaAcjyFxH39zwxSSd/m/YekYuJYbaDBt0
 D+D6WjiFiCuEOXerBzHRpXYfgrgR/9QZXZSaxIKX/e4jE7bxYMyrZsrZdB6vVdahER7OmA3TLAi
 MrazXgCb8pgU1D92F+NSCxzFkN9bCghJ4dgpE8n7WGiF/kzNTC9BJIGySJAq78opGgloCDvS4t9
 V7pnwgmPZVmJn8iKe5Qn+7DiW6i+AeCarph3UTyPRrfp5GbL9/Cz1BLI/FnY9GdsQg6uV9/YY2W
 xvEfGnSpbsPMHubD/7Ypz4sdoqOgVJ3arwcwrFyU+RDw2t2lB3yp6riDpxf8zSb1j+Bgk/Aorbh
 MfcqOsPmx3AKrr2xH9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX9b47mBspVOMv
 M3K4skM/Ef9IFYTTD7yOcQmyWZ4EVuD3WPS8daTR4EkqOleeB0LFfxGas8rMf0o1i7dmjEpXW/6
 hPympyS3N2UsxZb6T+RcSTtkgl1zJHk=
X-Proofpoint-GUID: rJRblen5lbijanxkK8kt6DG0EYJBfZKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-09-01 10:58:57, Luca Weiss wrote:
> The supply names for the PM6350 regulators were skipped during initial
> bringup. Add them.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
