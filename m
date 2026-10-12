Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4936D9EB
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790875; cv=none; b=pg+at0JezZL6Xdk/TICPwMIbqwkkIhc871Y1X1aIxyxHgwFes34RPStVK9RVLStnK0LK1RN5mT53/bCPmVjbjEhG04jbNA1jg2qHGxYUPszEXpx155aTw+lPcJ+i9Mvz6oos0yy+5lUcR0GzUUN2GZfWq00XG9CzgzFbf5+TnGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790875; c=relaxed/simple;
	bh=DOliDIP/RgU0tzWGxfO+vJwiWPqwVHmmS1HpzL3f/W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl40FjsPeHbIb2sVh26QhDdJHIRYrqUVGKqJ750UR/dAxCPOSnIxn4Lw3bhzItSULR039sAetqwLTxRp2/B7re9KfU7Zl0jlcMGQ/nSdABF7qiRiDKLjQUF8rK62qhDSNGZu3hYmCVNcrYmgwcQi4XW/VoYZAtvqlRjFZiJkaCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bmh6lps/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cfe4+wiL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bmh6lps/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cfe4+wiL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55aRZ1314401
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZWuDN9pFOwD5K//QEGKoPML07MF6J4iroVYXqGUMxo=; b=Bmh6lps/PXZ03dJZ
	zLpa/8XF4xKgytva97b2Ucex7SDMQfBH9+4y+8wqS0RDTOIYsF7VhrDdDj9Lsn8j
	D+fjTz07OiYFVJ1J4yYAlth25xNb9GfzdQ1ZbhtP34N1g21xQFP9hCKsT3hBcpVG
	tBzg/3dVQ8acEWDYH5OENBw9BJHCNhT1XpEukJDYdqDn2orWQV7kWfhhwPQRj1Pl
	dnk8hJ+U2kxpvErLj6ZJgSNIMqS7D7GBTrKE1P9bch5pXrOHkAvyN1Ut6dwLfuuv
	yN0lvd7kblyDRiKqud/GsrIr0lWjFwJ+rnTgp2M3usHZgQH1cpkzvYjdFrXtMwbH
	aj8Sog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711m56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:41:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a04d1cb2so5413516d6.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790872; x=1792395672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZWuDN9pFOwD5K//QEGKoPML07MF6J4iroVYXqGUMxo=;
        b=Cfe4+wiLDfd5FTQAuXFzGBiXQyqO9Xy3pd1l+zbUghhSUvIuy0DgdCc/ZNqwhpRy0r
         KFjGk10ctzqJoYdFkzzyoSOBETmcaUs1hM9qNfcpIrw7+5U9sp0SX5r1pvZEaz84kXPv
         ugbgVpNNN9zuof7YqIQYV8RlfcBIy7QyBKISecQNXCFXekZfz17rkAg0dJ0I9HrGqSvk
         bKEotxMbgE9CRvuj06ayS5KBauL1KvT1kfNikCWzykbFhL+4b+IU43pMG/zqKOzDzwpX
         ep+Bt3nlXJBv8oNISjlDveRjayus4sSuN86pJerzhdmKC6UPl1pICFh1EmSEIgvsqmWa
         QYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790872; x=1792395672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZWuDN9pFOwD5K//QEGKoPML07MF6J4iroVYXqGUMxo=;
        b=qRv+ZDk8bzSKfeLMuuBnhD0zsrbUk4OZ1KW49ibURKDLUvsoVWM947tRhlvMs7zAnl
         iLx/Envivt0ipL/cIAIqgryWqrksdmCarSiGf2KB1FL8gIKct/i8Mfb1HdEijY0D9Cev
         xg7f+sMrb0/WgV4Xvo9UrDhsGk+uA8ppLt0U56xiik0KPBQzThYXu/Ntncsdu+nBLt6q
         QrELCVBXx2inpkvqbDYAdup6hLfrVs1vPSGKVkr9RH4RhkdfIZOic2ex+pW93uSOkAsn
         iUwAFJfqFQM6XC2O9PpdX8FJaaa+sDjWwhM2XNLRCG3zToZT625amIrieKb7/enayOUj
         Ks0Q==
X-Forwarded-Encrypted: i=1; AKwUvByCTyuzY5gsfgXCusShiF0iGk4vqv5AGyGnpeVgOHAOaUH7T1PFbVOGxpQ+6vMDpLcFS7gSyHy01eJl@vger.kernel.org
X-Gm-Message-State: AFq9FYKMlYn2q3vLGdGfqFX/ST1VAXfTk/2KS71XDXDsVM7MH/m7BR/m
	0vrsXx0MpD1n3Xik2He0lwNtNlDJtTAIN5Hy3rhHDOhXttoGX8RXD4X3cD38M3K6xwwF7tXiVoO
	YmRFKQRF/MhZ8nJMxvM+2PPjR5PqEkKbwmzthjMqhh99lhEIL0C5vZsauPl67gTE+
X-Gm-Gg: AYBFou1XGdsZbwYpqfTWVKMovN8T51a23bGcJx/ay8j+EHxCOXbBUuSWD7sBXd5l2Fn
	SlDdbXjlq2+k859iYho2IH8fjZeEcBgZvvANjTyYiuFhZRNf0H3PAV9BcpCDMFLx7KnPvxfHDAh
	JUHqLrhVYnc8ciiCPox2ozeWoUOVGpcAXVHUzkyVviA4M5oUnG3jpHDbGzuABQuJz242P2SSBPt
	sf6NHuQROuYOhcAO63UwQYdAEapSkDDPvjvTZ7QcQujoB3LEFMoMEWgUFtJCQMAVB6i7XkESqo5
	6wg5FXie9OJ2LGgMPfru074QEFPs/bRrCCeKmWemAWaPgJ3PAiK0Nbt/HUeyQyjzPM3C1TkOdEf
	pTJlN0pREphXIotOe46UGRA==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr1473733985a.2.1791790872228;
        Mon, 12 Oct 2026 00:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr1473725685a.2.1791790870268;
        Mon, 12 Oct 2026 00:41:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dc0c8asm4576443a12.13.2026.10.12.00.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:41:09 -0700 (PDT)
Message-ID: <94131d67-0e18-4502-91d7-26fdaec0694c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:41:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX8kay0zYDoEyo
 QZbBNRh9mIkH4InADyjQbzOvM9wipzhBxqyDHk2btpO1sto1sE6zWsxC+mGvy950S9LnZUY0BCc
 /pYKPI9w0Qrx4ddwv78B3Mdu3vsR+Vs=
X-Proofpoint-GUID: IvTgD_g8Q3jF2CPaBB5agw3JZHTfrXqM
X-Proofpoint-ORIG-GUID: IvTgD_g8Q3jF2CPaBB5agw3JZHTfrXqM
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc8f18 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yp_Lh5tV98jg5vq-HWkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX4N2IHK7FijaV
 dpjyuYEahEjpNizvjs69lazgsB9Cjxctqbl40a27FpiBmhQV/r9tVHSCzXDBy/YnlhzSqwYfX8m
 SHPFS3lroVB7zrywg6TUL6xkqlDDh6J0kz2ODTsFybEDujZFHxcp22YuHBk57g1RvBWtW+DbTnK
 arBajf38AZpOErgrW+P0KtVi/E2ongRLwM57k3VzqvWPUx0PqBfGFN8KhqXQf/1sSoq0IQsF/tE
 zWPkvqkDqQGIjKTp7ED+tBERNk+6MaGVsxHF2fQlX7QjqNT8mO/oE1AV9gCpt8MJavJ7uWMVay4
 8WeVNmLesBNt19Jh9bE2YwUISc4pXw+OsS2VbLkILidKECqrE1BHOwopvpV3kd3OutDxSPYQvXZ
 FOgIb6LmScWpOclWffIHRVHL8tAEl2P8HIiTsomkK1kSbmBJcrqEZngCNmDI5mc7Tli4I5hcksQ
 PAPGpzAIE85qOLDJjjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120030

On 10/5/26 9:24 AM, Balaji Kalkonda wrote:
> Add device node for the DisplayPort controller, its OPP table, clocks
> and power domain, and connect it to the DPU and USB/DP QMP PHY.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

[...]

> +			mdss_dp0: displayport-controller@9ad2000 {
> +				compatible = "qcom,kaanapali-dp";
> +				reg = <0x0 0x09ad2000 0x0 0x10c>,
> +				      <0x0 0x09ad2200 0x0 0xc8>,
> +				      <0x0 0x09ad3000 0x0 0x78>,
> +				      <0x0 0x09ad4000 0x0 0xa0>;

These register ranges are wider (most are 0x200)

Konrad
