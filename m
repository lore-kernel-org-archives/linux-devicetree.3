Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5A4734C9
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142653; cv=none; b=LVdpMUEF4Yt7w2JHgd+SvzPAYfvNsNYaAXLk/rd5+bycera+FHKkmKNsHSxgJ/ncuZIBaavtFAC5MKS58wKjoVzF9LIoxIWFdXDQfkydUDbhoV61Yza+PHTiRkzR0+QVryBawqABQSiJmn0ZJg5I7TkG4AmM8KMH0Usd6cm47Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142653; c=relaxed/simple;
	bh=YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVrlrLdEKPaxLc9YccgZp05qTCOm3GWhaTJiWWqo5po4VQEnMXnHEk9Ej8/Zdjop2vCCMJ1E1VW4o2ydg2OOB8do2xwyjrdZWXsCTzH+G57+P12UmmYH4z3HYSsUeuQtwEHyiqM169f0aM7frbWOd/7v6WnuSCZAvqfFlVji9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCLIgTm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ek2f0PCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCLIgTm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ek2f0PCk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m6vB1465434
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=; b=FCLIgTm1fPMohTGh
	t4ewJk2jnTmXLW47gB52W169u9srbxUtrnezDLYoVxKvGs87OD4e+egrLAfcI7z0
	DE3GpVE733p3AnsijNAnjjESrbRZk0hn4UIBcid4lCoBeODS4aJPUqU2qWOejvno
	+1qmB1t+7uCK4ELGfGNdC7sVkCazwc/84bEhaCXlYcxjqX2u6aHAl8PTSUvwIJLm
	nwG3Up9q3ZkT0lS/63HCT6hQ3A2DJX75RnCnkpSavhPiLQMnXIu2R+3GsqWNE3u8
	vpiql7U1JXm/3QjsEZHkEkytq10jEk4clS2RlI0bhSry2GJ3YygoEBIGtSW9QkWp
	/nAt4w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wuj9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:24:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b89618384so8371386d6.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142650; x=1792747450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=;
        b=ek2f0PCkduMSDteWC8jxPRMuhdksYg/C6lrRf0H1T4kv9q6mpFlpgqVYj+Wyg+++RI
         W1yUv9t5YEd0FC/fflCE6tAllpV2yAOnJKX8m3A2F/U5P+EKrngHit1KndieqQeH5O+t
         RkJ8u/7wHKhxtHYIWds3nju3x3E4TqAmsfSZno421i5XXWivYndv3dMcaAKsrWNQTfPo
         2pUwaf7yzs0i0zr3A6UR/iD1cwW8YiEFzxe4wxMH7LMK0zw5YOFan9Hfx+f/5SasdS3U
         I1odA7icrViIOZA2Ek5SeeQ77rC9jH0BdUInUIKqVs876egKaRSPvYkwiyc/bDKcC8pz
         0knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142650; x=1792747450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=;
        b=jYxvQj4EBgOhJnfwq5K7kAVNGknKCObXNO5ddx4Eau5BvNiehKV3KWLTNElRj7CIJz
         SedbLGhwhHZSUS/KcTU2w3g8MsHyAuJn4+rMiyd2K7EoSnhBqMIwbzgf6KL5SbJFZC4u
         cGrDuRnYrfXIwe5s7t5GjmHB4g80WuMWaE1AOcNkSXsyuQgceLLHNQLsK4mkEAOTd2IV
         MSk8m0oXq/13nTjQnF1cLVq+hHJBs0Ta7htVk6uajatGKde5SKxy8Bw6RpnlNxIIharj
         SuaD95AL+4U/ccVGmXA4po1mG3V9i3HN2g2AxsbpBLBenaUDS5LGqOWBkTEpoXKUpDAU
         I4pg==
X-Forwarded-Encrypted: i=1; AKwUvBzN2H4OZAXvx6DWGssyh2jMP55zYVwzns2eZRJDjANvcTs3nzAmlsdCkmkiL8yBKOqgdK5J1JFAKjqA@vger.kernel.org
X-Gm-Message-State: AFq9FYKoCYxxrfztC8KPTDl9spQ6/75j+EBUnov5e7MB7/jvjKBSibqY
	h3D51hwj8pw2Dsc3dsDm1oDBYG+p9ZBj6SJVmy9X1Eujyr/3gLXXohGmTs0UEF5Ob2RtPtwYWIa
	rDGDExRfunRWV45t1RnpAabNasOMy0kzy7vTrfPxuuOBHPvuy6gMXdZhbLl4dfUnojKoppSWU
X-Gm-Gg: AYBFou1tvPKLB/F2/vLVSo3HhunWJiBHYTbw67kUDbbRGH6hO1wRrPUMKmuVmn8Fw9Q
	ClRqjJlybyoy8Rcfg2pJHqoO/eMdBMzT1ynPV/l6IahTjSxLpUUwWEcREAOk8LnCYXnH8wu0Ba5
	F4SkxiODcn6rkiy3M2psy4sASaAe9R3qG4ilIsJm16PhsR0zG9fh70quo6dmjvn/72EGelUftZq
	AjN6vZTQ7c9moGeaEe0aoozde6mLoMJy77g/Lvei8mBs5jOaFdIe9l9VALb6nmU61PWhPvBehew
	smFVWGfQLHoHW6MJJAwfXs0APWiTm0eSr6Kd5hewJPw+Z+vsyOn5Bz7zHjWZjKY1yV4rW3g6d9W
	kH2MZ2+jEPuL7s2KiSNn1Eg==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3730187085a.5.1792142650162;
        Fri, 16 Oct 2026 02:24:10 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3730182885a.5.1792142649736;
        Fri, 16 Oct 2026 02:24:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b19f8sm661345a12.7.2026.10.16.02.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:24:07 -0700 (PDT)
Message-ID: <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:24:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ciYH8kXTgtkvgj8f8D4ncKCnOt_dGc0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX29oEZfFmEGRg
 MJn08jrNsoggRoBwKuIXMWB/5ZLTXHrpFbypbg8109DaiL6wYsBqcLCN3ZPI6QEeDxPE6kZQ93d
 Ido9Zp0T7xjE5VLIEUYRQX0PJ3f9+2MVITEuKji7em/FoM+3PZgi4TbubXZtc/T2VmEtNxDfFQw
 PXoxoUNjs8JJCjl8J2g68phahpGCDa5ELEbI3Va/7T+uPFj4H/lkimhJRbyw0aj7hdBfksydmhv
 gfoKfFXHopLhVDykpI/bwnqLZbNWdttOOTFyryBnKY5iFUslBdBe2W+TEiZHPTtv9tRrg4uQ7Xp
 LhGddVN63dmZNMAz7UPLAR6aPIm0j9YIgfGGiuRCvI1vJe3rVmbg66dR0U4T2oJxaKXA7IRoClx
 HaNDgVhvGHDAtPA8xLgK8smDmjBbNdVG9Leavs5QYAClImg4MPoLLszVuO3jIs3LzMz/9Z7mtpP
 rZJi56IVP5rMmxM1b2A==
X-Proofpoint-GUID: ciYH8kXTgtkvgj8f8D4ncKCnOt_dGc0u
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1ed3a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Hm02htHfr-OdaEd79JAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfXwP/Q5uTserFE
 7NI65luhk27yg5FVHGRY0SslIOWWgH6f//s1N/8xh38T8+sv1aftg0OuC0CId5bTSKut6PFJOLB
 IWNBJH2ZPc47E/apTTdcCnZsVffaqMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160037

On 10/16/26 11:13 AM, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.

$ rg -i m31-eusb2 arch -l
arch/arm64/boot/dts/qcom/glymur.dtsi
arch/arm64/boot/dts/qcom/kaanapali.dtsi
arch/arm64/boot/dts/qcom/hawi.dtsi
arch/arm64/boot/dts/qcom/sm8750.dtsi

Can you send a fixup for all of these?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
