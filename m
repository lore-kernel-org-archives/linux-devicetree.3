Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167963;
	b=14cr6zjaozk93+iDTCmg4O0hpqbFibHAhBBSVMT2fQ8gPys0MMWh4zbsWp1oIzENn1Iq
	 Yv+A7Yttv0VLowh8gxJ/bbm8O+V/a5mEMfaiiHZXN8qtPnnV/VrHdxI3bHy5v82MZ1qfM
	 lrrMT7tb2/SxC1F7b6CUfU8BxDvPBXCCjw/RCrK1mq9+/jw91OLtBkgpL+Tp2rP6m727T
	 zrtD7SEI9RVYOG8Y5n/ZYzUM9BWSPMFgk58RfeNbJ+Z2kivlExzBQ1iQy/RUQzs60N3Np
	 tCHOLjopPvIDflZ7Gd+p2Px13PEj0wHlD0ihHo8/famEQ65MkjgAlDGm/fCewM4ymcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
	b=ejRoaj+yn2PwWpZR01WQkBsq9s4y2SALvqiRxEZm99BFfs84Nw86cqf2UfnRxO3IMS5Q
	 yN+2m8+tRYHtQdDgMY4uYjJsLm9LuqfUwBRv1+0+k+4BHUnkjrGNM31UrKqj+y1EpLBXo
	 vFam8aUjCJ/zP3e3Ysapo0AhWQVCBQYWr6CK4YRAL8VfZyKaoO8cPd0hnv7H7N7X4L66I
	 ePbL+ngPSACW0KJVMNjQmUB8804UA0zlFeFulasB8nubfiRIoSDuIS4FDs51ZhAoPP8UJ
	 RKlsj3xt4THmtWpMikCXfWBNQV4eQuozN6qT0V6d75Vuf8ccQa7kGVPhc1URRe4h1pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kNgUScH/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cunAVU4/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB27606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB27606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNgUScH/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cunAVU4/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewVr605905
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QMOQyHWGFl1egjU4MIi5naii
	YRrUSwo/0LdsRuAGp8I=; b=kNgUScH/89dEhe5udhgT9SLv2tUYQiSlZO72qVxD
	OaIOrfiaoKU5JiXC6b69czxE59qo2WfjGbKFhkpr5LBypSW9wzLDUmxA8J/uqKFv
	R56Bf83Hqyz4Xy9Kbiy2c9c4X6B+whYiCmcxGDzNWjhYZNfeJElg2FQqRKtsR81J
	Cj1hwKTc60rAPdhQRwLx+oC5KsPUJW/meOtfta6RD0iOg9plL3jt8FKtT9VWmx+3
	U6Zi9r4cFbM+YohbcrVBMx7vO+pvY25yoC4NcJ8n5gbKHFiq3+zGRx8biVmfoxjx
	io/KVPmW+V2MeRz33o1I8zb8EiNHL6eYQT1Izkh9MKtTBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrwcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:46:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536720195ebso15352141cf.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795167960; x=1795772760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
        b=cunAVU4/+qmZSiAgzBMbX/04tZzcwpkGu457bJPjfl8OJHV7EgK9UtKkF31I3yn4AQ
         tNtkYOv0wlV4b62qhei3mdyxcD17pE5TDUgGubERo8nIqRFb+LT0s8zwLDjYyk9gHsiG
         cJZqpKe7QZMlTWvlFCzP37Xxjnr5ZasHG1RdcYWlzteS7R9meUC1Bhxsszi7l/r7YI4K
         lykqij07IeMx2ScYt7R2XBD0MWA9Z/ETaWLiiQdP3qpTGf5AiILNwOMbAnEM3/LerMWL
         JY2NlphNRH79wW5oiWaV/0DL29DC5g1Lb/OhDvtmQMkYPc0NxibgNAsCJDlHA0D/2Pl6
         wDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167960; x=1795772760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
        b=Pfpjz2uGd36r/dscUopgcaZzkO8ignRZz5DnyhD7XXnpNLRDaBSahVUs/V/fS5iDvn
         dWRL73f7k3+mjGL6aEexTbt6IX9TEyjU1IUxFI7Fk2sjfyfGLZ+duZ6ZZyxd25iKbd8m
         rICq/xY2lnUya9SD/vxkZNKNdB8udMMwwfWClWTRsCDEX70nMLQLidB524A6fgQJprA4
         Nu69wKFf/IVhbpS43sYZeYIsL18TB4ieU2/wcdcY6sDlwe8TYXRJe/vn4x5sar3C+BIX
         KgAgNNOpi49fzE1jJXniPRw7FZ2+PNAb9bTAvlJd/CZMGgOnnSFmILhlTxCVUsKJShS8
         vhXA==
X-Forwarded-Encrypted: i=1; AL+hErE4iQAr5YJPTpo4y/ztGP3IQNj87ovc/JTS/2cwVpADUWAOfj0xvyB09pJQpatIM8qhslVXN4UP3k40@vger.kernel.org
X-Gm-Message-State: APuU4Z9nADYEOFt7uEKzMO/XGl0un3vLjnaemobDeAvNapA/95i0MjJ9
	tmXAKAFLoBMhDPwbIXBUFL/j/6dfJli17Stt6xcySQ17BaLHUoXAJma/R+Wqj7u2oU1lDQOHjRd
	rYYMWPk8WV6MpxuDkQrz6KAGH9SDOyHfo6AcPA7l8q3vTW0Cvq7yCTnHM7FWZuZ+a
X-Gm-Gg: AYBFou2YUKbsc2IFSF3jy5cZGa7zHZYd5Roxr/Cq2tpOFQ6QhaWBwyc443e+GP2qR5A
	oXuwnwWsbTeQwPqN1a4NlIEFhLKIr33fkzje563CC2u7VWZM89PRyRRhFfUKIsJOPOp8TWMbRxI
	49LT/KtaAHEZicu/Pp53M5uETKSGipkxyP1raBVQsgD/8dDxAMip+oooYZ4aPtKay0UzKIWUjVB
	oGKxAyUEVG34w5peoveNnsr4PcG7ZmVT2y4GB9WO5LAJGSfgIUc031mcyVifQT4mWSPM3W37Uiu
	EF44awTnHQNGJ6HnwZUNA5uErzaAcYwoW+JFAiWhU6aRa6IvSS7M6PQcoLLU16zy0OYLRYdNoo6
	jokKLjEkKisnevlXql9rA7LXVwgQFgXAgc3qHdxMc4nDUYPSSvy8PXh+yxwVDhFkn
X-Received: by 2002:a05:620a:17a2:b0:93f:2eaf:64cd with SMTP id af79cd13be357-949bab35bc6mr384601485a.50.1795167960329;
        Fri, 20 Nov 2026 01:46:00 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:93f:2eaf:64cd with SMTP id af79cd13be357-949bab35bc6mr384597185a.50.1795167959637;
        Fri, 20 Nov 2026 01:45:59 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm5035064f8f.1.2026.11.20.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:45:58 -0800 (PST)
Date: Fri, 20 Nov 2026 11:45:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
Message-ID: <lt5f7xkdms6d3vztcwsirtziova6o2y45hdovur7n52t4h4q6p@4nu7vv7aei4k>
References: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX2AWiotXlWO/B
 NKvz4GrEA3u8ShgCvdotnCFSh0JjgTgZYLTLCfb7d1ub6y44qOSyC51ToJlmbHzCkcY09cqbf9g
 TwSDavNhhjWSxrA3FYcEtTL2fKCog/P2PNXCsHGCUQSwpcHPtf7ZfmxZQW7TH5Kb8Q08QA0jH80
 FC/MNCtBn+YtIKIPUdTopAgM/bWJ6nfvJmylQ+go+CqlWfYURX73D141lBlQaZUE4SkPBIpxGq7
 EZdFXuYom2431Sk3sXM87Bh40N1FTURJOiaZlgHRHveGJC8wS204sVOOVf290tdSfV26EG51Mxi
 GqLlU/qfuKhdFIjXOwGQwGEL3BfoiO8aF2J1IE+525kE4ZqYZCzcFzjlNLD8ln2wBB98IfcY80D
 ygWKgdME1SKWxZ6dN87uJB2aUkBgdUhG4F59fKMzPsNEw2okQEYkD3du/2HscyR9/YV3VNw4i+N
 mc2nKN2jCDu2kdt1pzQ==
X-Proofpoint-GUID: J2cKOO8wwO8nRzxo5s8v1p1q4DaaRa2z
X-Proofpoint-ORIG-GUID: J2cKOO8wwO8nRzxo5s8v1p1q4DaaRa2z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXynm5tA5JxETn
 rfBC5+XWyisx1N86WWo9UcR4KSj8qnlPk5uxoarEaYcG80mcekbK1hD7GCXIJh9DkrdsszP9npw
 hMJwoDFAbMBOcJKWQpom5eDliRxu4ho=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0016d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WYvkMGzYiQLzyujf63wA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 10:46:05, Neil Armstrong wrote:
> Add the supplementary reboot modes supported by the Deckard bootloader.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
