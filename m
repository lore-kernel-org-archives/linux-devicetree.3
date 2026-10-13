Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF994DEC13
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887450; cv=none; b=o+z72IyydGCR1P4HeVo9HsUdFwMFy1u3MyOcNlJb4a3z9FUA3uGrEhlsH4cmN0tNxnT8z92hLVx59hiVZNcf3HZHO1TCrbgkqOGwh0xTcV2rOLh+6eRB3A1lhxA0LV9Bo7/5+X7mlodHiHAuKGsS8u9NY1WilDgwUz9mgHGkrpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887450; c=relaxed/simple;
	bh=s6lFgUCKWchq2Tr5iOLVIfwuMKBpkSgnVZN0RmocfQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaG2s50j6mal2m0NEa7TsSmHgMCs3CZVjvgHor25eI3gwkfu1zB33B2Fpt5KY2N3Qn8sXsUd0TvcPETEumDvL+39GTc2lrYs4iQ/+IQaglnaFrkWfwCxFTSIkXHWuy5LqAmSYKrigbEvO6dkCr21MuzW3ZaeiifTCKJOz8EQPws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHjbjc67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvjbOwNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHjbjc67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvjbOwNO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8ODmH3054788
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HgwlI9xizsLKQYfDyomPoKaDb7JMV/G/kjGnCEp0kJ0=; b=EHjbjc67pHrSpEze
	NjVuBjs7uhpk8Y+M8YKX7K6sFfeF9iMdab+h1oHODkxD6wl6SygnauoZKPV19WGg
	9NwA1BO3N5cZPOk3Qcn1QIt11Am+iyQF7Got/DKVglgxuh/PzAEWOlMtgEUex57M
	HO5W8AbqKrDMJeN3co0woqsGZ5gWHAcfS+fbpV/116DXkNnxsHxAnrTuaMUrFii3
	/W9a1GcOjQMXVSwJVqkknO6K2LTalB0rzR4BBUHXyyJgefBpZOS5ZezwAWnnjwxy
	yv4inm6WJtuut+UIHzGZ2TSZHDCufuzKUythwV0if6J4GwSc/VNm1P3PVgC/OOHy
	sfMJ+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeutbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:30:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb1091fffso19608685a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887447; x=1792492247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgwlI9xizsLKQYfDyomPoKaDb7JMV/G/kjGnCEp0kJ0=;
        b=PvjbOwNOKySjukburPiQOf1jB7aSdRViDndu5j1Sz+uV3igJPMjafaEjmOr+capIFG
         pfZRBZBYmQtAWsN54pMBavReCbiE72gewk2ND781TzffFzjdX2Dn3L21k0eXrLKYhlyC
         LDzUe7iSoMPpN+lOJYly3fYFP/Gq7/bmypShgjY2u+B/MentktdID9HA2dRVVHUngUTH
         OCZt6Z8D5m2ZxkKGI3fgKt/pqYpBO2uSqm3qxsTLQN8sz2JHvgEbLcKUGhaiD2KkkqYd
         xoUWMOD0PGiXnOsrCHEuD1yC5UrKr4OeyrohZEkRubBir145C8h39DQ8Re9Kzdi5m90h
         U2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887447; x=1792492247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgwlI9xizsLKQYfDyomPoKaDb7JMV/G/kjGnCEp0kJ0=;
        b=fVIHIDKIGFamor3HKMaBTMyOYbT8koUU8jgBrpv+oO61id+yY2J/8ss7I5yU8xNrPe
         8FxRmAE4LGpjc6VGQ1TkRzTc1t7g2ro/Z8evAk2iK0MMGsuOHsACJOI5ZsnJ88eyzCLX
         Lw2/WU/uWpse0UXQF7dpbfUrZ3kqX7VpK1Rr2TNfRrDxP5Oy8KsltSH/XEK05aLMAcZU
         V2eNRwMlGPRcuLOeQxGycVYYuHz1IzDy/0AKSLkNw/ckVCHX/ikxqDcjji2/DQ/1WKEr
         WeoRxkS2rji7repEn1iksNF4Y3jvvIhSLbdTbRuypQ/Wjir4lUlS9Fx6kMrcNrn4tkAZ
         mtOg==
X-Forwarded-Encrypted: i=1; AKwUvBx/TO21P3Ke1iu3DqzMG7YTJdiPudr+OHvYq6UJiZrGxoYl0JWdKHkZHm2m36rnKTWihA04LKE4rZUg@vger.kernel.org
X-Gm-Message-State: AFq9FYKCSJgYaTiy9MU1vj9YzcYJ4CftFU3XHDlT/l6gDiOuLNdQ+gXK
	16bsGZdLH7dhHXdHlbfcgbMa0SnGpaihM/wbzuYfGJa7XLpdwQAx9Y4U18avK5N6ZB2WVvtQbNf
	FuoLvAHpm/fid84IbwDvpyslsFZNbfeV+cHzWO7JnJNlK7amPDNIqvj7J8pjOPqAr
X-Gm-Gg: AYBFou0qIPrjVXFMut8yu7NeOWgJid2ycwR2P2L+siJO5vkW6xstb/3BRv6NaFa2/UW
	GFapnW91O5MhSVZCmuu60uWBmiuwy/l6B90CyMGxx2s7T1TlwaR9i/P71rfh5rQ5ZKFBg6h4AEu
	6g7ORufuwLSTl+Xan7Ty1I1fEukwZk2w8PCegvpMhrKeY4hBhQ2/rL+4niSKD7zxjntCEUEQlxi
	bSKJqKcJiBJx0el3dCw/uHp65v/JqfgPEXznew+K+s78w0rLE69KT2614OFRRwES8Brm1aTg6Mu
	zqrZlNQMwz7yKxCYy56LkXXywzwOCIQ3CIKs2sXdYViA0FWYS3Co3SD8MC6WAGvoPxO3KGLbpcF
	1rWs0fJbrwf/yDIw60M2bFw==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2251402385a.4.1791887447344;
        Tue, 13 Oct 2026 03:30:47 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2251358785a.4.1791887443027;
        Tue, 13 Oct 2026 03:30:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38050sm571524366b.24.2026.10.13.03.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:30:42 -0700 (PDT)
Message-ID: <762978b8-72ce-4836-85f4-2cd3ee4dc5cf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-5-406fc042162a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-5-406fc042162a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kwx12o4dp8jh53y0X1W6fBZv9Q99_xQC
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace0858 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1YZvB5OX3fR3yb4sgf8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXxR3u9Rx4dmNT
 11N48Y0YfjaEPD6Ok+pmdEYa2RbEqfwsy4fqO112xPCTzHBHMIH5G7Jo8wssAPe2nZ85rnFlbo8
 W+NGMf+8m/LmG/r8A60R6hTclk3cI64=
X-Proofpoint-ORIG-GUID: Kwx12o4dp8jh53y0X1W6fBZv9Q99_xQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX5c868wux9zmZ
 z/3SM9XLdB4ix5A9TD3YPRY3aWb9tqeAd6V35sQZoA8wfcVWekCyte0BKUUOa9sc+XENt02uD3F
 hxC2AHdJngSf0lBq5QgceMjnkhgPo78gMS8G0DsXrKxxwjg0nQTwGbkOg1rppFn3NQG7XhcKkx9
 jXly7kfpdwKYgyt36Ym3NoDiHnc00sjVpUsUGIErP+hHz7UMSPlygaSb9t1sfStZmsLEc57uE45
 eoDJcO7OOXNViSG5byCtECQl3d3I0k0s7wVo9ow2g+fnXk8zSCV6muk1qztOGhue6P7L5p3eQR/
 ymmpimIjHUgyCvznwRIsbgIZuQyezdnEJpBwH+j7Tl+IvOolLipWABDCUyGrw6nsH/kHtrtM05d
 ymv39yHuWjc22dlu7Q71gaPt7F9BPEd0Ac/xZYL0niZjdm7b4lP4yR3bB9/97nGYUDot2SSxcyB
 sW0RhbDO7kSlTqTuVVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130041

On 10/6/26 11:50 AM, Gopikrishna Garmidi wrote:
> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
> built on the Mahua SoC. Most of the board follows the Qualcomm reference
> design. The keyboard, fan and platform profile sit behind the Surface
> Aggregator Module on uart22, same as on the Surface Laptop 7.

[...]

> +&mdss_dp3_out {
> +	data-lanes = <0 1 2 3>;
> +	/* HBR2 channel equalization fails, limit the link to HBR */
> +	link-frequencies = /bits/ 64 <1620000000 2700000000>;

Oops, that's no good - is there a chance this helps?

https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com/

[...]

> +&usb_0 {
> +	dr_mode = "host";

OTG should work just fine on both ports

Konrad
