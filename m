Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296883F44E4
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535549; cv=none; b=ccv+cc3DOOzxbNfFYra7KWqGj2CQ7zkk7PIbCzieNq1R45KNm4H4JTWMnS+1X0j1BZy0BXtOGqHjlf2U8dCYJ8cQIyu2+rTY44bh/ATYr4WIqHcqOzFo1FAthKqU0V806Piqf05lk+4TOfCbNv5NEtqY5sJ33Ze1tyogHPNsjWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535549; c=relaxed/simple;
	bh=BFt+HHVErsZcnh/Y/wIax4idNUB4yL3NbnaeoV7ZDOU=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=aZ0Yri0x2eEunZ2H37LXHp0sA6YK8LLXchrC0knASxHH4vqK1uayw3qN1VMoEPX5cGyp8uLzoJqi81d7w4BY2QmmjuzFWDeXsNDaKVRY7SOZo1X4IX2Trw/2r1XUEakxSddx1+39oQrER6EULmZ//xI2tBCRyQ2VuPlWvGlCts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bpcetjdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3WpzEpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bpcetjdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3WpzEpy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHxJ642387
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=; b=BpcetjdysSKzyQ1Q
	N65NXKdsDRcU3J346n7NV392I1xmA+ZfUF/Bq5zKnyV6Y3UGWlOXAHO4oTcWexNm
	JjMzfrUU4WJzr3FXdYahPYsfLQIc6FCqXlL+ihLUQgffGqo14Q9XGQgfdjZaCslr
	fIs6KUZoTmSQTDDCOPpjLBmrfxX+a58fkgctvzChxLzAMmiLj7zVVo7hZo7alrrJ
	EzWsAxDM8mVeHsERCTIqXJE3NtQo/Q16H/HIBFGfIu7t4epHU532QApzht/njoY7
	RuIoy5MWZwRKVKwXnW3YTFZgLolF/Zh8XkJi8TlDtuQS8j5GfM16cM5MIQSD7lA6
	EGw3HA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrtrjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:45:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so4197758a12.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535545; x=1792140345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=O3WpzEpy0lm0T0QarO3Gan24tRlC+FAQIx5WgnJgNS3h2wRTTkHH8/5xior0M7aHjr
         4GACwdPT92x/JOdpTFtpizJsn4jep6oaK3FOg+FqS9Bf/s1YKHjTlYWDKc+c4e/XK/hF
         Mt3QpFuJlkpV7e+x+klOJrNE67brRwN77d01/dYrdlkT3fvR4yqBNr2A9SSc6yaetfcy
         UmrMyGHNkVolhCvXwPVjksQXEOyyJ9D1iCMhOKXrSAWd0Zu9OmnWACTYdMQnrl9vNHpL
         3e87KDRRa3vADD9uI3lAGruQ2Z1QB5DKtLiOybXsW6rz0gcWsMiTmpu89lMuyJ65C1oW
         ymvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535545; x=1792140345;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=lYdYKSn5SKjD/WFZnETzaJuQW1Cj8zudTb+NrpZ3UjYrooRFwaSt6e/v8M9FhLFQQU
         BRU5RV3yijsId+ZVzHLep9OTIegyY3amhpK1IcCQA4CdlLUJkarQVfwhpWcGJJm6gbl6
         2DkOKI3PEhWmD+YiqLWMgALKbFqfPUhBSeuVzsFiKR1Db/tZTWotgXPbOPpzKo4LYdSX
         N2Fr5Lxp+5DRdco+m9Y9SUM73gjjaqTf1cwhShhHqwvjlU5JzZ6Nzdc8Pl7+dTiZ8BhM
         msqjv+DvN+BB75xPELDIQ7y/m/UifBhm8dS8fWphbRIOthp6DkAbUlXhmz91pkzhnycz
         /Zdw==
X-Forwarded-Encrypted: i=1; AKwUvBxjLrvANX2QmI6NhunbABQnTj0KFU5zyhOhgoEDp+iXemz8f9tOqP2Pr0TGnUck/rbuthIGrzXw1dMP@vger.kernel.org
X-Gm-Message-State: AFuF++kpuF33Qkcgrq5irmL+w6sqzkaRv2/BKoLNznjZQPYycaHnaWPX
	BAQERfaCP3Ag20reDQYAS5HQ+P2faCDwFJ4Ecunp0d8iwDUggzqNbWhPOQ63I3ADdxaT4497HZV
	7SXFioY4l4Ygm2WRtkh9/y5Nggxo2VjSfO5jenedbdGis7HSMktI1p+dYacpdf+78
X-Gm-Gg: AYBFou3tdMNsL7ICuzAjSb9pGsdin21156V93Eg6rOcvIqPAg1C0hdLYWzPwa5XMsLi
	w2naqRhALSJi+MLOx7k4XlClO7DLmYT37wu85JvcLcn0V8s2eyAfrAy8+rs2mcrKHUOSanQyRX1
	ntyGxsC0FnOqpM8EMh70a85zCIP4NqJWnf2v9CQfdHgvD5dcgDdejc/5+RDIO7mhCvFb1Cf4LWJ
	ne9DP2vIdJffL6myuUr3TKdMD75Pv6H5h3V5STTgx37CYBQs7s9Y+gVgtLkH16IpsMwYiu0qV5C
	ViRmQ2kUug1mCSRczm6xq6fsXJCq3r9/N6Tabjkuu9E46v7CoQBoLkp4RkD46BqhCk3BRcrR7Rq
	PmB3m4h+DOTwMt3SsOQXsmy3w8BHZAI7kKR/aByMgneBGJ8o6jhgkNIueBUVgpgY=
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023344637.46.1791535545436;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023320637.46.1791535545012;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d492d7sm599567a12.4.2026.10.09.01.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:45:44 -0700 (PDT)
Message-ID: <78ef7040-0284-4199-8468-8d7cca7eb4c2@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:45:38 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v19 10/12] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
 <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
In-Reply-To: <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8a9ba cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=N5TnpenYHa_lGfR9nhQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vQcyxpdDLJnw7-zo4CNEQNhALSsJZRrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX4DGTy28wmImT
 uNuUFDuLrH9CmmfJNZG0rzDA6EiqEV6q2O/SHhW/XI5ybWQGtiACQgNLAvlDyQQRZDilorZntgn
 wN3Y6RNN+zU8Dc7RU0Lv+mHDLDUOozcpouk5FMCESVwnv01hgKcO/4BvM8T9CrbKlmc1+PM7kWG
 ffC2MqgwppxPn/EFE/QzPGxlc0GrBC7OY2aYZjPNyUNRSvQl0BCs67hCgrmUjfH6d7h3MzdEe+i
 1umh2aEI5PeNfXGCMUBFNoenPROjszxKBlxx/MImPSYZssVXCUhnD636W+TQLaMUQ972IuMRLdZ
 BsiALwh1l2D/7V6ZzW3safS9/uYgiuFCH2KgUjPmp217LLEKRU0pCy0SlDIcqXJZOEc+z9IHPYa
 xcqkMVHP+8vLNjp9ltUCsUI51dYffAbvC2KXdQM5YyuNskrBV1D/aDUWUKaqtUsmICftaFxUkez
 4Qg/GAarBW9O7f5Gcjw==
X-Proofpoint-ORIG-GUID: vQcyxpdDLJnw7-zo4CNEQNhALSsJZRrj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX4p2qJAFl0+CL
 dEYau9g1i0zbOGY1tqovoqEbzMzcBqp+fZCAg7cL2iFwpRTCcmIJmj7UT2jTojMeuCTln1uEdCs
 wRySDrN7mX90EKVFY2Vt9JFCywOAnTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090034

On 10/9/26 4:40 PM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 08/10/2026 08:14, Hangxiang Ma wrote:
> > +        csiphy0: phy@9523000 {
> > +            compatible = "qcom,kaanapali-csi2-phy";
> > +            reg = <0x0 0x09523000 0x0 0x2000>;
> > +
> > +            clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> > +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> > +            clock-names = "core",
> > +                      "timer",
> > +                      "ahb";
> > +
> > +            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> > +
> > +            operating-points-v2 = <&csiphy_mxc_opp_table>;
> > +
> > +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +                    <&rpmhpd RPMHPD_MMCX>,
> > +                    <&rpmhpd RPMHPD_MXC>;
> > +            power-domain-names = "top",
> > +                         "mmcx",
> > +                         "mx";
> > +
> > +            status = "disabled";
> > +        };
> 
> These PHYs should have their ports defined.
> 
> ---
> bod
> 

Ack. Will follow the Hawi/Maili tempalte in next revision.
<https://lore.kernel.org/all/20260923-hawi-maili-camss-v1-7-cbbb42e534ef@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
