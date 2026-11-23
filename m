Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463385;
	b=Tt5emK8qXbOYxNFs4d6gxYamxXkO3xH1wt/UBkwnZtkRWjNiN6CvmRU7MpqxonXx8CWl
	 E+3bu35xDfgo1e0bi6XHRgeIlIm7JGx8YazIQDe8NjPsylaD9N+nTIUOQExXvbaba58Fh
	 fD3434DOe5x+725krvvuKgqNFOF29a7ZggSozniHNLPZazJXhuA5/Z2fwci0wlcDFoZNb
	 NO4Eb80SpCVYbHJu+dtLrIsTirgjgEHIEFGYtPhr2se2A9RGvt7CDTXEZa9T6CHQaw/Ma
	 DYwpEGoc1ytwOZlZV3FMcX25gkcSqpXRQ+rnzKdYD4ow0gnks0ZvJoeIysi8GKc+JnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MnUPbac33oB7DwYYreQY0TnDm5ON3zVHeIQCQdeP63g=;
	b=R1cxZVGJhb74HLj3jgD2bn1gvhzyqLhNRk8Vh8otSsZxvlcnDpEb1o/dBCRcRDEOVbl3
	 McWgL7rG7qVyAqm4mEnMaR/UDmRC4BfhlRPU0X1B94d8doGKP88R5z7W/hROomC/G9S0e
	 qwe3npk6bqR8bEbE8YMxLcqSnEHfNTP3MILIaLZo/yD03alT5XQF0KM+tavNIZQZbwZss
	 OIQOvjvEUDs4h9SUD3anE/ogPn2vjM9LWrLW2uvv/luE14domaboVJDlcmox48/bf7BIQ
	 k+4ChpbA2ZlpBnByU66iFHYDQpprDvAbtAZCGkB4qine3HTLtT00CMif1tGsMMhvFSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3ILnN4p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DnG19iGG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EFF606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3ILnN4p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DnG19iGG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGwdn2486606
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MnUPbac33oB7DwYYreQY0TnD
	m5ON3zVHeIQCQdeP63g=; b=h3ILnN4p6pAUHLHtn6/uY3BEiVSbEfJ6mZxqdHsD
	apTOFnWsAWp4L+ABphodZgPm6kmbuzfDqEe1TPaHoujKW6Vbao/loP8ejAuAiqLU
	7ihGqsPf2zTWsGU0fqUSqw6pitGjx+yVq00OgsAOMg4a9WTe0ffppb23Ez8tQvQe
	U1Zs5VYyqhTBbuSfyEQ/NEFqs0crGvkACsIfPISMj7Mmz1R45479O9RytJ0tA91d
	lu9I5FrUXk4p+WZbjxHW9MSpeHNgzrYTqQ6aWPKanUx2aclEDIvIuvJcPzg+oCL9
	wY0l6eN9tmmMF4FE6KCeRvyksxPXgxj4M7yN24DvJhq7vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy037gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so928192085a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463383; x=1796068183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MnUPbac33oB7DwYYreQY0TnDm5ON3zVHeIQCQdeP63g=;
        b=DnG19iGGexn7py1k6oUcKtYtcXOjtCBg1tXtSug2KkVczJvTgdt52nFkFtTcEIeOaF
         aolhe1fupj6kscsXQwqMv+xRn/WFLDcxvOxrGzknSokW7jjYfLnF0YwMijZYo/xl/GtH
         cPFLkXxHlsKl/xGcUVernGYhMbYC0HFOvLfyZMwPAsuspH/14tPrcN3X7wwK7hTSTEEx
         vbpeOEH9/onIZrm2qDWdK+ZMiRhiYnyEnebO39p/BwtWZVKfZBYzIykMe1h5mDfI0KsG
         4bxojCDOLF8DkxbldKLbCmgb7VJ1KvbqxVx3F1ZGX4or6bTvFfjP0wpDUMPL7CXZoGyQ
         0O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463383; x=1796068183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnUPbac33oB7DwYYreQY0TnDm5ON3zVHeIQCQdeP63g=;
        b=T12ixxaXk8LDD4OFl+/jTHENr7XKhlncZsj3gKxMgFVxwl9z22LMknR9DCLuvonR89
         +5gEg/KFNXlZR+QbLqLRJcSZVHBCrNT8y7f6MupPnAMz54dfBHZqExpDFHP5QN5AIbDo
         0ONelrnefEBsRYcq7LTt47SSMClBE+596J+BbLPf6v2qpP5DioUT1nU89JSY0W+RMOYv
         yhXYJhgr7EvWKV/utUjlZFXagSu+BsRV8czt50kZqjvkgt6Fg+Sh+0nx+Ru2WDrWDcv9
         bamW8CG7JktvW0D24TmnNTKoKaLGGeip4bz78mMxpZ67wimJz22fcZROavoaat9efGx2
         lDBQ==
X-Forwarded-Encrypted: i=1; AL+hErFy83GqyJ4lVCMWEOwYSeWTAVyxmNOXCksIwJj92NigG1TgjeXgeOgfbYWX2BhvrNNh4Nx7CAVHZ+P1@vger.kernel.org
X-Gm-Message-State: APuU4Z+bj7mGV03Hluu0Ajeyq+KIwnq1A11iP5vGPLJzw8cMl7o90luR
	8ixNl05VWpRtFJ3JE/qCPA0tQyYg6oxUrZVEmu/z2Rlty3MGZLsGO0e+FhYkGxq8w6DJQcAdlVU
	2Sjwsoo4EqGgWy8gJT866ACPayLLF7k7tihk7BISOtnv0OVLSBtMveXvoF4GoOChd
X-Gm-Gg: AZFdTZdjznSwyVLWT477G10XbcQtyr//yZi2NPM2hJY2qJ2WP4ZJgvKuAv2YsS2e+WZ
	RSgGM9FFngEwsxR54M0jZtU1o3qTy4HVyaUo1+XLRVx8j0lhu9YV2SW/usyWspuskvW/Lk2iNI0
	fYOqmKYiJpUWxsTJ3u8pAdLcsVlnssiY0iyBu2/Zw9R/ozroloKNNkcnDuZZkfTCvEQAss6FsHd
	uHdvOMTmLV1lJZxwccZ79AmH29FduYaUOevCcp9nmY+0/+jTCM4xOtTL+FeYyEJAQthNzprs7j6
	CEPYe3LYgsdrqqtjAIpTWp5z2hkSv0bnBG8p6lMuYEus+I8njjc4kBdo1yjnkIbP/krNv2bRwO+
	PxFqIrMuUxRbqAqXuxgwvy1q6nZg3Z5d3yKevaxNwpcl8dRsaIM4ljLfn5aAbjke3
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949ba9cafe0mr2231788885a.33.1795463383063;
        Mon, 23 Nov 2026 11:49:43 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949ba9cafe0mr2231784885a.33.1795463382425;
        Mon, 23 Nov 2026 11:49:42 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm421919075e9.10.2026.11.23.11.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:49:41 -0800 (PST)
Date: Mon, 23 Nov 2026 21:49:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
Message-ID: <suwsp24d2g4wz253ucaekuvnbvxjwrkojn3rrngb5ajfurojfi@fvvkxzr7fxsm>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/jIlb6GKXqEl
 dOpXnQuDJAKvTSTHPEV5KnuNRDCW8ZMyzjHRu3Yxvm2iEfRrhcDHdyHJF3tomnRvFqd7UJrgkcf
 /9gkuvIyv6qtwXyrQ4W+BAOvOKcY2LwntGjQkx2tdvp7YAiQ+TUWxGgowG08pUoRKKNB0cH9Xmf
 BLbtjH2N+J9eP9caRR3m3hh4LdWpu0tY/VpDMeZnAzGdPh9uBUbXdcRZnzbCjAp5UmgBucYaX4n
 LLiGnrgWWt6c1iqVLWIPhlV2HErfNKa1i/YJIPwLz1TG6d6y4S4PlJTmpj+gSG25QD9ltLnlhaE
 j6svcBoQYAShZFPIFK1DTPYGHT6ypYkduL/T3vW7xCFYDVwZVYBtQZzQN91ZjSzsLGtnibfyqti
 qNIdRl6VYbGl6BOnzjAdxXk0pZpLRdcNjl6xXZyjPHM1Rv8oRAfGTAhQZHrkFvux8uznUykUfVY
 bPi0REyqGYWCla4FT7g==
X-Proofpoint-ORIG-GUID: ebT0U5xz2bx7oL8zhZOjv89Sl8on--4v
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0498d7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aIm13q2IE7s_2A6kjp8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ebT0U5xz2bx7oL8zhZOjv89Sl8on--4v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXz+cHAIT2oQaC
 7lzYfTDEPRnD4ZqG6ufvdDdERaMqMgk11EVGahqE412wDn2nj3nQUKn/bTpqatQlpeloaESOF0j
 d0tbeXouGSTdp7wGgYrXU/yJ0H6yxEI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-23 17:42:59, Igor Opaniuk wrote:
> Describe the EUD:
> 
> - its CSRs at 0x1610000 and the mode manager register at 0x1612000;
> - TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
>   syscon;
> - its interrupt (eud_int[1], GIC SPI 189).
> 
> Hook its port to a second endpoint of the dwc3 high-speed port so the
> driver finds the role switch, while the board keeps the first endpoint
> for its connector.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
