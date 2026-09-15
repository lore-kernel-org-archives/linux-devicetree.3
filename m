Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E523F5BE6
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466956; cv=none; b=u+E+JmVRMsBw5XuVzWh6lPNst/ijt4WjPCkdR/Z7oTuShTrhqPzK0R6/umwJqgogVEmgn6Lr+8dMaHqbslhvcLfjhRPlUTMAtTVoL5vDZu4+WK+xui+H/seuQKGklNvmyrGneMVpGn+ANFfWITnSxER7seEaxfmHl1mZtJUEC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466956; c=relaxed/simple;
	bh=tGjDR+zQ31FCowO41vWdnhNF+/J+6BC2DcHVzDdm5hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeoVp0GzPOduwuDO4lvqtkce9S5w5RpNeTFl5gs/H3LxWpktWQ/4S/PaEVnlqvKHdSJmXV/+MJKN56zGHq9g3gJfnHZT4p4ZVGnGBWaPV9TDqEkXdaCTf0qgi2ICovID8UEziuc6iBw2Dx5Bum3whQDZJp1PBc/9QbHV7o0QB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnfUtOHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDsuvQBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnfUtOHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDsuvQBq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hESF2833235
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XP1SokuVGoe4TY0wnvrhUdss
	t0yinEpiUMhs1jxHPZU=; b=WnfUtOHmqAy8wvNelI2I+7RRETqhJ4IEwDHerEK9
	jQry2pjkPo51DNxf7UEeYhZW7QmQTJv03Ucc0Qdw1svq8nQMJWKxNmHFDJqYF3Lb
	p0FsyiCCC/w8c45OCafw2Er4b6tAUnakoSqhGlsPQKgrkx43u7QM2fCQtDKVp+ER
	SPZkNsZPoUvBSbiEGA6kQHiBFhAsdp/H774l00UtFmN9fgYfdMZt2FSTSXS2TeIi
	94D5iNcWMTM1vkWjlaVW1w+MlyDxdz3pQ0mlZ9KAgS8jSCuUeKnIR/qoxGThBfxr
	xi1eJbq+hI0T1ONJ5PlvJOPjzx+/Gxe7Tx5N6KIxTiT82g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd998q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:09:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso689996285a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466953; x=1790071753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP1SokuVGoe4TY0wnvrhUdsst0yinEpiUMhs1jxHPZU=;
        b=NDsuvQBqViczinTTrX0DheNFD6HX1nJfNCTgn8KITC3CAmmGdZs28H3Qh5tPZjkjql
         aNiul9EKFaR4wtMi2NP3Y+c2oxGOJlMv/OmaZ6GxcQ93ke8KtqIlsIjTAkz8rc55waGZ
         jXXrme03Tx+XkHlW3TVH9xoCRWFHmIivDDs6XqEMVHXSYUZIbQQ3MEZN9pRfuwk3yORx
         Eu3azV7hoL7g+zvoH3bAxzb+EcfIk4ojflHUane4wQgC7TVR5DNOW+l91bicMfCPI1H3
         hPhL5del+sQmK89bI6ngD/YQOf9iUjLRJO7aMdI1GdYvLVgLY67nmvRTSu1BD96h3Nca
         I3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466953; x=1790071753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP1SokuVGoe4TY0wnvrhUdsst0yinEpiUMhs1jxHPZU=;
        b=Zl/h7nSiBP8YGkhOuEC1tPhszPWqfFjm+XiBR+y8nKUq0Vv+I1i4uzl7Q4j5gq/X36
         0byTtsqqTaFAvTckJZaalUoSmPi6jCjQr4K9Bz7dwUohASTcEAvM9Ost33gEsUXki7GA
         +42i7MSDDdtEi6x675QAoJJnA9eNbLFiTojoDeziSbFGBC3zBap8aRedqlPtLQMmDOj0
         nnKVejLnGGvIOXqIuoH7tQc3DIxBznwmcldjK6k9B/7wRgja2IZ/3xCd671onj4I6Igl
         b4d0Go8HlHKvMlQapt/7anqlyA1JM/MYTPkBDsPLbpFq5uXEpxu5LANVe/Wfy9DOezYU
         64Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzS5vBYGLwfnJ1j+M4KgRpasbsmDvR3Y5YFLKn7xfpqzlzcNACk6OGCKyIinNlWmJWMGEpWSz//RwSX@vger.kernel.org
X-Gm-Message-State: AFuF++llCH3+z1EV51MAFMov75uVFFtkSr7fxv9dRFVfvT27wEMbQ/az
	YqhlOC1lF3j/JFG6R+KQBLn2TnSo5IYGEbeQqPp7zniReg1KLBTsgz7o0mTnfx3x7UbJukxcMil
	ZEuC2Xu0ud6Y7nXutoypY0xSMP5w6I/x2EEYG3txAJxGP950HCL0s9N1FD8BPnnmN
X-Gm-Gg: AYBFou1F2KigHC7SIpKKFPLvihkrnIk63pzgOVQvL881HgpA712xkIKtTij68SCMESA
	nrW/+yYXH1xOxRx9I7A4eDPF1GMsIEcR1dUp2MoMupmrBKB3BtxFWcvFF2cooyI+G08bG8EEsrn
	wCPjAzlThhZV9NPBErN0YQpgYs6LKVfx7imlazZMKw1MVzRrhP+Y3uh1N2B8sEEEMsinaNlJzUN
	kxEvmeBAG385/yapESk5jQODljCSfkV81OjKDg1NSYuDgSUgGPHrkQN5uyRQs4DxdomeopJmHrT
	diCDi2fXxIc8BysUJBUTaRLR334cBY9PsJAOiOs5t6rHlnimCHcpuYMoSmgcig05BMSGqMPNJWS
	nsk4jRfq74CFODQ==
X-Received: by 2002:a05:620a:468c:b0:939:a199:45b4 with SMTP id af79cd13be357-93a29a77442mr901515785a.39.1789466953409;
        Tue, 15 Sep 2026 03:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:a199:45b4 with SMTP id af79cd13be357-93a29a77442mr901506585a.39.1789466952493;
        Tue, 15 Sep 2026 03:09:12 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef7ecfesm54019035e9.9.2026.09.15.03.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:09:11 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:09:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: avalon.vargas.centeno@est.una.ac.cr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Message-ID: <ymoielzmm2bdw7wxwpjncdlnuuuxvyv6z4t47dhfsmmn2xi6qu@55hzft2ep6c6>
References: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
 <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX612HocqtBpCq
 tIvC0oVzMybzksQPGvCnQTlkKzEeoVQh5K/FvHGZaIYPuwOdech+F9hV3+JLxLpO1O57BjwVtke
 naT2rZtLNqlOevzqq10inBGdoBQZNs0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX+2++WpK27qHD
 ZhMSM4Og4CO41nekbaoz+8teajcQLGt5+iNFCdp3hNfr6DVd8jOlceuepYbNZsb8ZHBQ4EF8gm5
 IOF6nNitHZig9rWNgMlQNcHRQxrYEHqUYOgWiUlk0vL+q6npyISRcP88S3eElqn7KuzQYYhLe55
 VeU82LW1I8Tm2aEO9WBeKMTK8N4TxvWoqVHzCFIAwaEs+CHiAuK3/Y7o/9Cx6l+DqNNZUS6Knvm
 7OdQvwd2LIY686wkI3Yn8XHH1ZAsfettqLKImg778kyndoHZv4ItA/Y4542TlaJCYi0aK3yeyCw
 n2Fi55H63k3G8q1RHDk+IyHVId8W4wfh0soc3LONlMmeimxINygDGvlrLcL0vH5uYSG042vXy0K
 8uB3SBywoiqHsjJMNW+uwXcGvtc6DFUV0gu02HbVc44UohxggRedQQSYgki8WhXsapHJFay/boo
 YsgH3Ia0GPHmJteQMMw==
X-Proofpoint-ORIG-GUID: xqBdLh2vANdWA4OUvihaWcCVNzJhfsbu
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa9194a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=MW_FOeIp24l2TjhtH0UA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xqBdLh2vANdWA4OUvihaWcCVNzJhfsbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

On 26-09-14 16:04:23, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>

Please stop sending new versions as replies to the older ones.
It becomes hard to follow when looking at the thread.
