Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7007723D7F4
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909644; cv=none; b=sskcA31TcBQJGv/TO648oum8jK9NIGSg71fOOsZ6WGMeveI99KBWvpfU4fGsLMVge0Zu7B1LSyDSlbQIRwnn4apHka6XScgg2Wfj64tXxzeoTPlAjp1z3mOMAWPrFXcR1iZwzNpdvL0qLOSK9iY1DuJDOOkUE0h2Rg+oIR0NF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909644; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=XrZv/cshSMG18hotFElTPTFkuk979mboRYduHfybbzOuOQEPMUrADxzldx4p9Hu/I1v1F8tasPSD66to4/aIrXVFxxPcrTdTy33GzXZztUIlxqWtLukkZ34RkTiq54dEx02hJZeuHd3K0AvIETkfs+YPdATTQbl7BC1L1RRG0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcIVEy/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXlFHizq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcIVEy/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXlFHizq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lsLr2270412
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 06:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:to; s=qcppdkim1; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5
	NMpJWZG3hSuFU=; b=CcIVEy/p0LaJFmGTVqgmrZWDgMOoARS3bDeMkLSsqxHMWa
	mLoOTA6M3uCvqAZc4zBu4tdktBaQX3XWqOjIyH2aVRhAhlwKNPtWb7vTGqBpvyIE
	qKaUQQKsrHuvD8euNDP8AVyhn5K3CyBw8AodhCWHgkLxIM0Yl48HTX/i8sepkUAw
	Mu092nhAO1hXwLsL54bUbmYHGmxBeRCFKX9ufQ7Qjn/XZ3l6CpaOVctJUMw1wcdn
	Tuts4NiYposZsMPCjVH65rhUrZSVk6pOLaFvAJVsJvM1ZqFZ0fZTXI+QrQYCUbdl
	1OBtb8COao1yXPF47Fe8JtgzbtuffPllKyCuvTsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3qax1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:00:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so11034325ad.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785909641; x=1786514441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=jXlFHizqgDlBk1QqG52//mZxnlN88Y2x3KM2bZc1RSb+WnjmTIKKLCoxUspbS/xHs/
         WN4t8jGICvq+IeMvpRWdlD5RbRb30m12Yv6S6IO4JoESs/9RqaD3x6Xt1r6s1JnGzJjk
         6xVH/1w/flmndoBGSrNhBqG01vb+2WnjVCHlgEaggkOuDk3QtSnwXpgWvqnAt0CuRPys
         yzMHCBetSUyT0FgNxmwdze0OYh9BPNtzrntrDe0WEzzMc3mW7x1vFD9qnyiR58iSghD/
         /LP3D3H6Y2knWIu78B36OqqQQvRHKZMAO3v5yAFQyUk3aOEzRnaKhL3NJCsSMD70gAml
         h3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909641; x=1786514441;
        h=content-transfer-encoding:content-type:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=KbudvV8+LwMIHh3HLE+zlpXB/G+dLVxEDh0Ban/bUBh5RBXenitLL28Lh5ih0ENmh+
         0kHMyfYX1ARiJkV8p0zKlFMGuZTiMXSBcmAbtdP8N4F3cSriBTzxKHs+mLzX60KHh9qF
         s4E8HYsz21BF48JJPwkrwt1pjEn7s3sbC7CyTTXNcMshgy7IdSWgDW+LJWq4Ip53Uzmy
         keOQaXF5g3sRhgNfWMDMRAdXbVnv3AC1D75c4F1Os5+0rnScPh3t57fp664GQ7wWCFBo
         ufd+2e1Yhfbl+JlQlRB1SdPA297fTnhCokNXdDynNOkj6pIPQtUqDXvq/++4l9EgNIqm
         Vrug==
X-Gm-Message-State: AOJu0Yyfev0h/2zk+0NOa8osbD/KqyiEgFgmDpQeb/1JchpcqxIEALBV
	Wn+Hg6OS1KvhNDHtehhNGefYQAFvK1Q00OQTg7+O3J3XIo5llpyeY3mBUy+FAwR6n4a7MJ8lrbd
	qVbZERz+hWJ8GAZMSEGQoBcsssQiSrI0LIPhXsC1jEGCr5RUlEHCPKeIzmuU4GK91JpkdhaeP
X-Gm-Gg: AR+sD13PZQiOoDtWxHI3IR4j3WZnnhwkvD0BS6OL3infnw5Ur4yRfp2EfLqxNpulQ9c
	/wSTXR+zBduLqik3AtmCbe4RP1PSoFwaCPuqahn7LWhsPX1reNRjjycPa5ZLWsJuWKKRsNTZtw5
	oDVw3pN+fI34DGUHoNKVWV9jDvqEG7urhUK7Aq+VMsLZxUvBw1+bKdEdREIAbfqsOreIyXQCLxp
	xsTyv1O2fo8loiLyClvuZ5zJeIZb5AztDMSodSA1xIhpVUXg/FsOEWYdSEhmVqx+fyRPVzG00fH
	xmSTC300WrlHH+YDNPuzHm24HCGdt3ZGsvZycSyOL38LAobll8Y2/NKb6OPRq6Bhg+OFA060qb7
	OqKyabcQcTN/0K88xtNMYfzYi9+v+QtVzBQ==
X-Received: by 2002:a17:90a:ec8b:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3903c5d313bmr4439704a91.13.1785909641142;
        Tue, 04 Aug 2026 23:00:41 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8b:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3903c5d313bmr4439634a91.13.1785909640629;
        Tue, 04 Aug 2026 23:00:40 -0700 (PDT)
Received: from [10.217.218.252] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5fdfe5sm975768a91.4.2026.08.04.23.00.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:00:40 -0700 (PDT)
Message-ID: <86dfcebd-d1d1-4242-8448-2e19895f8d7d@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 11:30:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: devicetree@vger.kernel.org
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NCBTYWx0ZWRfX+VnIcySnkmgL
 +ZtpY4nMyc+uo/F6A0rddz7IsCSgIT0yIctO3Jsqn4OKbEAH6UTawSJ/HFUw0OCw1Al9m/jaAVK
 5wrlyrwumhKjKY9O0KspZ30oTVAea7CsLh8CR67GgqwRdT/v6C3xgvLV6bIuK6RVc7s4Z4AEH6l
 3x/c3F09Ipmxg+fZZngZMXS4oulCK1McnPKpt0tnPdsw93+TFPBm9Lm6v+dB+Ys4+K0/ZJo4vOZ
 8JmYM1Bkt9jn7Z6aLuSu980KjN0v9OmQ25htBHwagxV1X/GIgBk3eQQ/ywH1qRdMu1Z5zeukbBE
 +MKInhWKQbnF2oBsfzmqoJLExEnCDbMuN7tFVnYxr2b0Im7WekQzRIXu/I55Gt+FSwcfbQScdob
 ReQlv+T7OBCZdbQFnjbuf8i/UZIrqbnkps1h6N1yIl8fRRjYHmZzvLWfvfaOfpOVMzSDwpY/Bdu
 6vHJYuMXqMrkSigdWaA==
X-Proofpoint-GUID: 5ZwcmKcAKi_bamNjJ-4kr6r8_dx8S26R
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a72d18a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=s5jvgZ67dGcA:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5ZwcmKcAKi_bamNjJ-4kr6r8_dx8S26R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NCBTYWx0ZWRfX+B/3lixB17sZ
 qobB+m17cGK6zlGC7Qd001PHOEvgI1qRAb8M81dk5g40TPMqgrSD262msfzdS2V8UpB4qQY/899
 WccMkUGXwFuJJ3W6bM+LT2cDhPyIZjE=
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050044

