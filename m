Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56444E4C34
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659021; cv=none; b=RT2ovzQx0euRlTYi7j0errD/WxoecDk/ftdvYNlBCDZ6FR6qGMrjzjU3xsRYyh8WKQeP8dogscttM5GcZHVtcEvHarNEdvtctRiS1AyZIHtkZGvNJpFThma2LEUFmpvDfuEkKulCKDtSB7YDPGhr8BtEHWfsDV+xIhmfuNjwxCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659021; c=relaxed/simple;
	bh=EWDDxvLh/ajUORqgSDl2rZ8ViAb2Wg2kGEU9j2QUOOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ty2D3UPZwW29zCOwJ7TIUxI5NZlkkF4nMie/K9DfwlOAGQXF2wM7PgjJREpmWu79hZQUY85Rmfx8Lg+mtHNiPuIKoeo/ngrzGwAtQpEK0kmEi7gbPduLTje4Oh+6ky/80YeKAVXJNloQPIrX/XFkhAAUnBnkJh1iBpAQdXlDdX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsyaP0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQMYTvPL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsyaP0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQMYTvPL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiY7v2974951
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ri1E8u+BKFp8OWjyXvh+uMJ4
	co8edga6jii1ZtQDCCU=; b=PDsyaP0eFQq0gY9bRGD1dBPRKI+Mti6Fa6Mjx9P4
	/khZUBYJ0eBzHeRoEwoD2BIAv1R1UYKV0L0YH6aTLI9OE8jA57mYaHLv3jelQ66Q
	2vN1baVoBfaUxZfXQRxJ/MWfg9+zKIqYi32F18ewUXW3XhPsDW8hgyuXpm/npdUE
	eh0kwUF0zhAS1AO10UaJngpkjcqIA6sQmOMEqu1EZHf5tTw+UyGNX1M69T6FYH3D
	uwGIaJSJ0XTUBI2Zmu0T4rdQOuc6mYtXsJoD+KwwihlcaBfW0YWoUGIcpm7N5LLS
	pvypELLWoJjYJxxdP5Alw0GmTnYKP+QNFEMG4ZsO5NFlPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6hpuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:30:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso219933285a.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659007; x=1790263807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=GQMYTvPLu1a4ZBbD7WwWpX/WSxaTjHibIB/F3M+xX412BoDUspXI60DoS0vfAFphk2
         tqdQG5gQyQOk/XmDBeyiJ0xNP2bUgtA53iYb9Mckodn8ly184M02OLcLsIz+TMYP8p/2
         DoZpDeSgllJhlACJ1dcQdul79F/Tmxrma63ld8omWj8wyImMw5eYKi7hoAQEPFtC5ijG
         3oD2TDV6AQjh9QcOgzMxIK92DMR/ZqmJQSTb8l4u+c4eR8kE8t0VzqkLGswXVnpY5Z98
         RNKaHO8bO34W7EIxll3NnqCAeXWOBkK6vc5Jx87pWltlQZiiJqVzXkgDnswrpYURrxaj
         H2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659007; x=1790263807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=zY36FNcyN1j0xvv04O/yOBrQXlF+00AVoBsn5xQJ9bgbD3ZGKQcsvzIdKmuj2fobyR
         uwMXfm1LvK8pVTP7BwG3V3w0/H344XFi67bCKpV7I4JR+4CIDIGGTLMRfIDgrreTncqz
         4X32ZWf9lFlQkbSGlMgAY1j2Y7D7P5yMZu2j8yfUY+QWCtF4ro4qDbjbTQXA4xUjITtm
         wN/XoVZv6lG96umj4VaMPCLGEIPkSJ78DYUWgRb3MFUPoBfdZAQYmiTItEKsn5IDGIhH
         e998AvvhzeiA0e5if+fMihcvQMoB4nmczqPpVY6dOzOk85qoR48pd75Ox6R+qoxiTVsz
         1P/w==
X-Forwarded-Encrypted: i=1; AKwUvBxqNo4GsKu5xIaSVPvpE6hPbRXeykOKYoVdkBR063Uud0PYa1aYv9NPwhOTEtFLWwYAcdxlmy1cxTrk@vger.kernel.org
X-Gm-Message-State: AFuF++mmH7EmCp+431rAawGg0Rl7qwnCpxk3w62IxWp2QlTdkx5U80t5
	hOlfTWpmiG2wJn8qH+KEYWBi2Ohc4zw3GDnTHgkYvGYHJGFV7SDs9VVWQHMHQCsWwdJ+FX1ulg1
	p6FoLgXjhO325GBTrRgaBdytFTceWBVoQQIxXmceLkHP+nTAg2eC2EfdRpJ979zzB
X-Gm-Gg: AYBFou3549vrUJ8KdkYWQ4e2F1gq8piB9+JFPu4svXDe26Yp1YXx7OBtqU8JyMHRyL3
	RxQLBrQYDIkrLU09qMXW9tsz7lImgy4PmG4OJDDobcoPyHqJUDRRHcqfzxYE5LV7e7sWw+zmEyd
	wyiiwHQZFYn1WbQoMtliscPmXspylaz6tK7e/6mJDoZpxur2V9V3mfehoHy0GRu+yCUYHdeuFIY
	6eTA1SHTLMp46Lm1m+4Zfae3kQOLa9gtCESt3KJFVRHnvgq2LYqPd9bRiaxark4ZNSHFy4yHi1e
	Rwn8oJ0y2cZI411mXUBgm5LMVwp1A5pdxcOIkSR7dMpax86Um+J/4TwY+7s1iXhVhGm29+6GYIO
	eTVK4/Sib02Oicg==
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288319585a.46.1789659006327;
        Thu, 17 Sep 2026 08:30:06 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288311585a.46.1789659005708;
        Thu, 17 Sep 2026 08:30:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm141129705e9.11.2026.09.17.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:30:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:30:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay for Shikra
Message-ID: <ok2efl2jwkpm4etywz2w256gozewohaznorhhb6b3zed5ktr6f@vvqtflnebftn>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-GUID: _a-uXjA-SYgbwns81kTk_0ZRnJna3qN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX+iVVgtCkfgBk
 VfHfdCbDgj8hPWu+nAS6KC/rWlKPNkd3pDfsdPnIr6PORlkQDqDC8hO7tLUuAA9q30MR+6HS1UV
 KppsuBHt1LyLx1jGwK/ZPGU/twBzG9fAU0B81L0+GLkcouNFfiJWrHrg7Tp5hYeAbZ9jBcYywLC
 iN1UM/0XnVxnO5xAfSSp0CdB/bRc9fKIIZhRIMIsvN7aXHaW9y6EDzixR1Sdeo8Wi/AM9ZjJ9Ok
 cfwWIWbYigyNM92RbDCO28YWQv4BEXqItDEd/5nn1ZxQ+RFfzToS7esm7pyOmL/XLgEpE+4W1Wx
 PHcVzeEClK6y52imxLxsEG1y+2eEJU7iHu+xStuerstfuygg5McKNA/QqAT1DmZTS2kdA8sodUI
 2j3e3BwsagLJ7KeqMW1LukzwEHIxpjg+G/brnEzjPuH+SIUjWJ3I/EtZg+wIhVueQwonTWGcW/j
 5nWt6FQTo8HRj6yhAOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfXzrxj4Lj9YjUG
 TbSA2YDXU3O8szvfQ6i/MPsbeytDNTBhJuurIDLbJUgEV5hcc8vakOKuKWvMkHYdKSmTrromVnF
 olL+jTqMo2X0U0dQuQMZljPOIoNXC1A=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac077f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _a-uXjA-SYgbwns81kTk_0ZRnJna3qN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170220

On 26-09-17 17:11:04, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
