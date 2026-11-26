Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702615;
	b=raGzq10rLBlmeELsrscZfxKYrFKTUAXiRMqhhkkrRUk8KM3pnwCInICG5LIFmFj5Twz0
	 PEtr83I7y+JvHIWZNgHkt2N/zayLAMdz7I3h3OhxgngU2Ozm6dd0eOzXthqiULNecMWEB
	 xtcAipdy6rvmwNmA3qDcHJYDB3LwUxf8Atj2q9RizR71Ew1zr+yp1iqAbORj1rbiBiSbN
	 E7IDiJamUwyDtnLWQ9YE4VHrIdDcU/90pNfVIMZ3dw/stLAtVGtfQmDKZuiORvUTWmcNm
	 28t47xIaJzvvP2Z8j58I+pQWi6A/lvGhozJxP/mAUOP0De5vTlaQuidnRlKRnPJxKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
	b=15nfkrTkC2xG2btBZK5k3EKytdYUFQUys3fX5JYI3GqXTwQq5cgV63A7C5eibdAi+y8k
	 JVudG/0MqXu9nzNZw27BFPRS/kf/Y2VSDpFJAU3EHDr2Osv8pTRyltr+WnBdmzpHqPcDZ
	 ZFjPJp3QSJ+ntmPMTpXSU/SKGuHJ28QvEl+F/QgwNfOxKb8ii3cxPzd9wVJ9h5oLqXrn6
	 7geMf9tCn+cmhuQ4/9eyi9/dWci+TNmlLA4nfVUYRvumaAFYVaFylYJrUTh3NEEfCUURn
	 aBifoP3rJI+eYr14Zl/yeMF0Ia63PF+ulsnRRgzAJorOVPnPvWW9fGH8adgV6PW74gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWx0JCOG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTmTi2HT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2345606A33D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2345606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWx0JCOG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTmTi2HT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVv00633459
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=; b=GWx0JCOGicO0i4LW
	G4Tew6ke7Z38UvBMWbvtQ0nk5TvnngWUI5xdJJdAuoV7XhvJzd5cHgrU5HjfBEEL
	SO7PE+zqMDEqV3Vyh4/HDSYqte54Sigk+KSYn90RV1P+tfJfHFS5MFoBvmMILDIu
	9FPtEZawDTrbxTXHBeZceFFMA2uRSK+NkGYGNtE6S0ctoeGEhT6C9WgxLBe8heXo
	kqs4UZxrElCwFGRfjGGjEh9gAFn4msgsWzRMursE3tHNibr9hppCoV8swVgR3nRH
	lXXrJffwBvWD0SkKtlTMaDPKvbbldhMn+Eo3k536gcbrybBKUvViobR7R/swALKk
	iCczcA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne1cc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:16:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9212747f4a4so7282776d6.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702612; x=1796307412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
        b=eTmTi2HTS+/zYBVxzOZ/wJNY1vydahLtkySrZ5RF2oHXwhAifl3QLLBhx3D+ynnc2O
         FBXELO1Rt7xqrpZDkXgxa6Exl5gXBdWxyuyX3vW+054sZfePh0LQyJhWHkUD0Uf1KZoU
         meC54OkEcULUem63G1pxMbhCePawtKxIv20I7z3Ewzzd8ReKig3MDHiFlpt78cs+rAD1
         Zfg8O0TqfNF4VkmI5sBmGVYVpFldE3LxrsVIWUE/n3B8AzWcbiRpBediw2AnO7jt5Tom
         ZOwxBwHDHfrtdoIPKygHIET0puGq71L4q+1Ph7B66EFP3eLNfvi0dqc/NOMsR8/RqYQV
         yU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702612; x=1796307412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
        b=koRwYi/xesjavkATzcWILwfnS2OLY4RE2dMG2KflLBcjwwdVJekpUr16dW6PPRFMia
         Q+3dEKP3cO1kRw9P8uICVzS32KnNPICnxGofJ0arV6WJr66WEjNJBU7KMPmVr2/6S/vu
         A9rPWcDIO3C/jT75/jfmh5NtdrKA/6FT5vdoeEv3yRN0B4zHK6VG7YdLX5LzBnGCj1WW
         h6pBzD/Nl5+Y6Dh/mdyqkdB8wS78/a0ogSmA11uurcKUpbbGfkT6nEKB51ZqrZgv6fGt
         bMj+d2ZaPNqOfbxpEnMntAF9sLk6UOUma2+RPlmUr/29e9lag6C4lw/mVCN8IYO8rgRC
         Pjfw==
X-Forwarded-Encrypted: i=1; AL+hErFuKq3F/SJ5wvsZjI2m0NUTPG7mU0waVfEQCEcNRyQJrntcW6Wn7fI4DRnd2D6BtHqA9SBYILXPnqnp@vger.kernel.org
X-Gm-Message-State: APuU4Z9potUMidpIO4JI7Dbm0QbDU/hZvHQHyTy65XK+1Y1o8V9HPM6G
	UBwNf9WRn7vvITzcFFfKazFoWE5a/iYlCP9fb9qz+edXtZnmdksFr/x60+xogAjcY2QSjt8GRrt
	ZLXCdWp4E/NmFKGjIw4zw63VgyISk9mGoWIc0WipqU4Do0dx8l8JmEuwjqvfv2iyH
X-Gm-Gg: AZFdTZcRd7wpNeMDWTf99o/xtTOFkjn1h5uN+GWbxuxhYOHizRmdl8lwKvN3uGtAcmX
	vYMNQIG2QoRW7GB6ZUm5R5nlf/9qBnD62KWQKN5v+Wjl0N+2dfnBoN7YL2UT81erN3R7N6OJYZG
	3pg4WAk60Nebn3fT/5OhtrkeKosNZ1TyY+67Z7IvQv3cvQtVKY7fm4jNvzrDCOCa6G1g+V5bsEF
	27JZIeJIWEfatMEeyiGPxFpR3Z4dlmWkQUzL90d3TxcjF6deVjz7cKUojZ3SvaqCgMi2pa+k3Ca
	Z2kUpTXGnSVw4XSnwAAeO5Irb/Gc7CmWXVvLTj35yjyfMeGZEof3sT/5RDckOcDNW3NqkR4OgN8
	jlLRDkv8MjT1QZ9Pevb0RR/PWK+ltypWex1T1CLI9MMuMCaKbS2E0QNVI6F5AHzBaaDTc11s=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3824486285a.3.1795702612043;
        Thu, 26 Nov 2026 06:16:52 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3824482985a.3.1795702611598;
        Thu, 26 Nov 2026 06:16:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm2858929a12.2.2026.11.26.06.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:16:50 -0800 (PST)
Message-ID: <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:16:47 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b083f55 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=i8PxzMkZueSLsKX-AXUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX7z+X5VP6X7Ep
 zUVCApphgoDrjQW+gVWOrhMRZc8g3ow3upuACFYgxjToLih+LJDHEjWSXxk5ojxVSWcCK3zyUJs
 JdXVJRu40d/yjzRHz+zLR+oxbFYWW9w4sXSWFAX8szA4H9VxFkHlDCQKoCQNzkJ3FiwotjVjVUo
 AmRA7Uv9rE2v/A8NoGNyLmxA2mik+kS2DDyAPo6mHzZDgWQ6FNnCPNDSFnPblyyQT01+NNO6bJ/
 ihM3Vobho0jm8CYtp96fGbDOX9EUDSear1iUFyrgWjd1yiQrN8KWePrNduDiZQxBOIef4hIjK8j
 5RMCAM1eg2YbPNGV/oT+ROuTsQsc1ITB42F6yzpa6NgVdhS29GGWoP6s662cQYMLWakhVrLFXnc
 NBiVgmgOq3rTK4ntw+r+yFrhWN3MoXXKUKR2NnCBuqlFwadXsZ5CyNee4xV4D3eYyv2I4eAcEhl
 5U2FFiV4gTrpeJzSp2Q==
X-Proofpoint-GUID: NLIRNDDyg9ZHoB2MdH3Uc0_dZTodPXY2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX0+GeS81yiTxK
 Srcd4HNFPI7ieHTb6bQcFhdW7Tam0Gnji74fIzCgCdtLgx8OG9Bk7vOf2FN33uF3gVb7J1o7tXW
 T2Q3s2RxSJeDx7MHJL1bnACl+MpIP/0=
X-Proofpoint-ORIG-GUID: NLIRNDDyg9ZHoB2MdH3Uc0_dZTodPXY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055

On 11/16/26 9:59 AM, Kuldeep Singh wrote:
> Shikra QCE requires an explicit core clock, which is missing from the
> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
> and specify core clock to match updated binding description.
> The crypto interconnect path is already described by SCM node, which
> votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
> the QCE node.

I understand the need for the clock, I don't quite see what we
achieve by removing the interconnect

Konrad
