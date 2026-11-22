Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338321;
	b=r2XJA03Ode0cAj9ds5CwdkFyU+fvWni1sTwWYImda9hsaq5/GbZjSp0YKFiZGwVLYHtt
	 WTMwBNPex480UykT3jlUl6BC2/GRDPWDBY+mNRzq31wkBE0/5pOWUdf2/6ijXzK75Pd94
	 7OntLLROubfVdOpe7YB/JK6r73VhZq3cMzEvLMJRTOz4uA4WgVNvszYnO19Ttn98AaffO
	 ZlHPiBkq9Td5/5BW8rOy0EO2hbxn18RgXDxbBQ3iUZ59ls+f77ND31jbwuHPj6E2uuk0L
	 B55EQ1TxZp25RMgg0Xq2LEJZc+x5K0XaZuO/40J5VbsNlHUCU2H/1cMsqpl7XKnKbiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
	b=zNoCKXtEbuwbqs86yvhJuBA7o01JNfYBQcFMozy0Lp5y/mYeQcoyc9Wvc2BW4tfl7Idr
	 iwkj4uvNMrBcX9NoqstNqKc9bJ/RCGc4LS2aQzt3wSikcOiJmn5jXF3Hm6UV6FqBK59bC
	 9xwb4ayvHj9phWke5WS3bpHeqq5leoKbHGJ/kQUANqqiZE+GrR8W6YDqEftEj1GYMKRWy
	 iuNx+bst6t6NRnWD+ATOkQX3sERXK51RatG9EvRxvLI6dzFY5lvLHsMXWW9bfNmeBvvI+
	 UNsFqovFIaas08xXNpebZn7QLy0ENdLeLuHqpXjbOsQHkW+d2eKSCNhiiMv8IiqD4Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNnLWepe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FErBUCC3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF12606A339
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF12606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNnLWepe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FErBUCC3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM86n2r3588642
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=; b=iNnLWepeZEbGS53P
	Oj5AMw5fDdJf7FdLuZp1XGexYur0dkcBgZKyGnxpw7SfO8vHf0bu/Xrj8v7YB9Fh
	tia6Md+VxBeiR+poVoOlJgX2u8m+aKwb7OdLVW2E5V/rHF1tk52BqgT8DA2N0hk8
	ghocdyMAHVWku5ZuPtGMm6bBfjOSMtFFveXWKTIxFotyy/ZNQrzghCo0N3t9Vcyi
	stZBDAfyRU0zS8FMzyyR6ghwhqWut2d33xdJdCdlS6IzyQPiAn5Fls8obHh/tCPc
	OUKYB+5gEjLzx1NKZgcLMSq5E35zekhEGqJ7IjIU8xksDRKWPmh+vXIWaCIzwVFE
	+QSXMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6k4uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:05:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so517445085a.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795338319; x=1795943119; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
        b=FErBUCC3gc9bxaCLxgifwmc4ZGnYAsIMvnx6J522JJrG2ABwRgTEKZSBrL2lkUgSb6
         /IUnJhIh9ifipWa9hEkE5xe1kXraXOQ2aaAtABtmc+z4DZsgpTz4baltsBePBqPWMFIc
         lstQ9NIRpUa9vxgmqTtMCMQFis9hsjGrPEP2T61Gb9Oq3ZDC1pyAfc0oW9RsOUPFKgPB
         wVA4zHs7b5B2cJlkwvkh9yCsRXrT0nGjDKPLYZ5KmWEJbzwupztVxQVWbDxFf3I7UtP8
         N1ekfOFrJNRW9Y71IdBhP62IK9C4rzQewofHQBmTD93N1MYqCjjidiQ2ku0MOoSCfdQ9
         H5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338319; x=1795943119;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
        b=tLTTdHwJKjvby4EHe2PAF/q/os6RNRUGehkpPQnif1jgoDVC4istDwNxmVpdrYO78L
         hJ8ACDC3gEq7SgLTriwyzrEpI/X9aBaW5kBvaSWpcAMzkUhgRc9sQa/1c4PzHvsosJQm
         w7lrSujhlOrq3JwTm/st2C1qXY06y0O+skX7wzh+xg6h9tJQ7GiUSxmNui/towRMJFf0
         Q7Uyqwj+SWm7h0WYGzFXWYuQOYcUbTisXX82CBQdrJOvx/+Joh8QQQirr28GBxaeVKis
         no4fSfC3lxWNV/0DEKQBGrfaAl6Rry5Mvmn6EYODguqblKSE1EKAadZ2YZhxhJs9EB1e
         rV8g==
X-Forwarded-Encrypted: i=1; AL+hErEROHkRIw7DtN93P8bKseDghME8TTKWSAkyyFtEJsdnN6fgC5Q/7fY53xPwr1CMvEPJMjq3ryMMN/le@vger.kernel.org
X-Gm-Message-State: APuU4Z/u6McpExLNnlugDGKM3MriL9qp58N6ICA+q5YjM3+PYROOwck1
	eTX5A2sxfbXf/M0LYywdqf3DaJxHtbLOtSCAqjkMWoM0FbCOqhCamjLbCOn2mqTrqQheKqo94jS
	5VqK16e9F5kG9Fgmf19qPgmPmuoF6Udm9Nin0wZyoQMReQZyr6ebSvgOIEAplAj9+
X-Gm-Gg: AZFdTZfOvOhFa6ew8WINZA2kVfIjRBlI+p8HEFyCC5UYQ9VW/UdoVx6lfx0h+aY2VlA
	GxbjR/Cy9A+0RIoM+jIGL4qj+a3j5rd9V+64C/9TxkpdaWx9HNx/tZf4CsyFYE5LF6pztlq0VIs
	UwEio57HT7J9ub7BwEtS89mIhtq4Qc5yWwyCseyHnQKxdZAZ/j4kkhBHrMc8Fb6qWnRm0FIMtrC
	4MgUYK0BCCIF98sMHL/PBGCRkzq4+BL6nBusqGowYZhGF9ZOosJkpOsGPhvh2OlJCewi9/H18Zq
	PxqJuXlDokg9wourPpQnE5zJmBTUeHkDMifodbeRMJaYnQsXpvkiusKBpjBibN6DHcNPloxWO6R
	H1LRjJkSYqQzb4gBsDwrGp38fNjCG7Ypf8Nu9McIQlK3o5bQEgy4vdEMUeq8cHg==
X-Received: by 2002:a05:620a:540c:10b0:949:bd26:9334 with SMTP id af79cd13be357-949bd26944bmr1011098685a.37.1795338318833;
        Sun, 22 Nov 2026 01:05:18 -0800 (PST)
X-Received: by 2002:a05:620a:540c:10b0:949:bd26:9334 with SMTP id af79cd13be357-949bd26944bmr1011095785a.37.1795338318348;
        Sun, 22 Nov 2026 01:05:18 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm16878371f8f.13.2026.11.22.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:05:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
References: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 09:05:08 +0000
Message-Id: <179533830885.820169.12795261112757355999.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=631;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=7R6ofa5ylz9rX+cxpLl3SXtzYiXYEYo3/l7RH8vz14w=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrArBHh4pKPlzUXOphdGhw3mLyJSktAheSNIVRM
 8QmyaqwAEGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawKwRwAKCRBjTcTwaHBG
 +FrID/99rOh0xy3glImPrS3kTQSdESiR/qRYGaXmUAV59gl3SwhIaGONw79gMgNRq4vj62GtIwX
 Px2Bfp4wuLeuCz2UTz8ljZmuUecVXKbIYKzhgI8tlkebfk7lGy9HzqB10jeoGPJHTUzUfKYR30d
 QS3F9VjQYfwlir8+E6S/x+fk/LL4xv4jKqtZE0UdiWypCVn0rkbQL3LyO3sSk8rvXhy0e++2B/t
 zTmR4I5RJoYCHcXqjmSxPfAzBXVg1ZDZ+ZPr2JSk2cUMHGaFwFhlg2PwvGenkvtqSbF8AgpEMG8
 nERK+W4bg3EBi61CER81NlpB3bs6bH+hPsNqXCEXlkKUfpHnyOeZdaf4O3Owj6fA7lKV5wfpDSl
 pQymJ3omb0149tlM+PpA12MEo1tmxqGb7IXwf471DzxVIwJvjgdVvH+qLEsW/w2RYUcCbvlOP/J
 91zFCvDlej1HAhpvoltHkHxLvo6/86luTI6qQ8biF9jdExmE+paO083U8rno4e6p7HzKTv/lT6F
 SLCoib1qUw+O8cQTiFTocFQzRLSFbKozOG1CM4Yi+E+gJ375Wl1qot6unt++nvN0qyBmM5kGvlH
 glGag3AOphytmE9DZY2uTkgr8qiQr/9mhRayFaP2+1zkUwCIhdvW6SJNQgwhOcyektjvGYbiaVY
 iAUUFOE2vd38EwQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: VrvaBG_FvFv2lEtIE8r0iXbZH6D2AfX8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAzNSBTYWx0ZWRfX5t3EbetslvVW
 wq7Qdv6jsb3kzyPaR5zTBinj9osIVKm82x2XEdwrXsfPpS1ZflptZ9yAGQwQUqaK941KeuvC7eD
 oANQhxKVVpIpp9c9e/x/O/R2n0k6SoM=
X-Proofpoint-ORIG-GUID: VrvaBG_FvFv2lEtIE8r0iXbZH6D2AfX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAzNSBTYWx0ZWRfXx6w02yYDcGS6
 rhpS7UJrY4V7vlFRf6T0O/5sxQlwm3v8DXFXnyxm3BNcg0ygDyq77QkREvMVwb2Aa5iWTfP1+k6
 FJFLpKolH3gqCd5RR9iyX932LQ+3JQ1ux3JuED9KIc9WR4QLQb8QDCnai/QmMPxiiQktmRr86XN
 GayrJxwQEtTsiXnir2qWdSqNgS7cTOCM7m/ZAo8M2d3SCtOKHtjTQyYiFK2AqBuAMmNxwU9bcAt
 4zL29Mg+C4tSBsta1Evejk56VhdueogVRy1DqljONBZl3EnWvnU2+vmQBkzVhK2e3O56zY08ZvS
 XAzUPfL/c1jWchOrcIiSCFjPc8IDIXAtt4wYz6Hcj3iD50d742hATkxvaTrbjAqDsZkelAzFNZs
 FccSSO2R5vPduVg8eoaBFb8+fDVw3JL/gSx0j6RBVSQo/67hIJpHLSDVATJRlJrGuVrxXiNFetZ
 kkVqNLndpyr5hbwyshw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b02b04f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Lx0Idy8H7x2P_d6LW2cA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220035

On Mon, 09 Nov 2026 11:06:39 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> The HDMI port is driven by the third DisplayPort controller through the
> DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
> bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
> not connected, the third USB controller only serves the eUSB2 port of
> the fingerprint reader.
> 
> Describe all of this so the HDMI port works.
> 
> [...]

Reviewed-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

