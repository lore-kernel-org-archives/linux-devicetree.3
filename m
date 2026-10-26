Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010114;
	b=Ra5qANrw8kIZ1XbZRh7Wt9b9vVdslISkFVvr8XPCLWU2ut2AapVkiC89mo5TskFkQcsz
	 umcWMsUQeYQtozX/VRSWrT61o4DO7f+oupbAhtydwjOyhs/31+Cm2/2tdwlb+gTnkrnlz
	 /Bu8C24QHo/a5+ankMcQp/VrqVnQnGvVpdek0+yNg6Q+pVsBYIgg4bs/ZGhZA5Lg+Rtsf
	 bra4jpyeslbhZkSFozv2aQNlYygMTXmu6wlR9UNKZCyUjX/+Sex1SvEGsuugbKCyNhPEG
	 lnxR7ANImWVcpzeCmQAUUmUu7Axb+6RlV4QGxP04WBpED6h8D/6cgpGWGAFmdpAWlzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
	b=g4KmOOTPHa341fUPGnCEJMYYM5fYfKuGMwEq6AHik5ZO6lFF8sWjPAJfH25RPYEh7TQ8
	 exl1yX6utOnqX6c0HWqPXvhZ2IG5LMICj1zv02q5m8AjfbjhzU0jHuoHpn7qFCjrTXxty
	 Hno9lq6ASt3nLq+TDDVJmTECrW/oi1UW9dgfNFr9KD/ZEgqt8Xpt9pqtiY15/P6aGefvV
	 wFbRAWocGm3oIURYVY+Itf5p3pG5L604jDPV3ut0KzZdDZVgUDGSBvsjx2obrKK+p6cVq
	 q59uBOOB+fkoLb7zxf5EcXh+BWDeQkYXSRdIEfgFE1j5qDkuWzPvoo99/1s+orJkldw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BgsR7eXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BEcnchRr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FA5606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FA5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BgsR7eXA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BEcnchRr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b2NZ2206280
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=; b=BgsR7eXAbqQXSPx/
	N6gDFRCOc379islQ+jlox+GxXIFV7+KYeU0dUMR1Fg+2vKAOscZDwx8fI5za6FVb
	tmOeyTwsF+nKgRKB+0wBhVJncGauRmdKXy8dRZ0w2svtnpoRDtthmsIAzeOMnnPX
	m4K+d934e4xoGzKEzTVU0xf4HMML8ip04I2vXaNqStC5J0cO1dEkCzcHW06j0tPP
	5QhTTUwEhr3i7nbSi2BFlYBKknLKTsL445cKA3IcygypPUxy9Mt3hNNeHn+w57Jl
	vfYE42hJpai+5RKzYyk3BZC5VHAXjTibxYzQUeDkVum2eFKdsIEQwh+AmlrxvhxE
	+grsow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunwmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:21:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso720979185a.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010112; x=1793614912; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
        b=BEcnchRrdTw9rOa9jKwF/u9svRAUiw1Qj8JKqNidOn9oCrhKGd2wKpNJhbqBEIcuZO
         Nx4FRP06C8jna+fSdWjgDS0iPg+lRxyUAH5WDnZv3dU9DJlentsEyNBs03fGXVpXsvpv
         VY7qYgQ7CI/r6bIjLiybFmHNt14uzhradYtJ3s1rENSKGMGHdBQ7+YZ1ENRdqyMiUI1P
         ONGVAvGgqqsSc0bLIukhUj35lZW+ZQ+GVu/t7LceWdAe1sswqOruSX6o14vO86l8aQac
         06H/nhocX8HC+TbyXvr16ZX5mmfofyFszSG25jk6xSn3xxCZfh+BGEs/nVDBJW0bCxC+
         xs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010112; x=1793614912;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
        b=WcfzG2brDoOwbUxOrGGFFCJVmTKC8WLE6dJNXSMIzhBbAQr28qxJVCd1olu7GhHonx
         sTjecoAVmVUoYZz9KIRgvzBi1QRvQh06GDpSzQDsuVwWGImQrcu2cAqyJ+SHOIokatk/
         C3MMeVhBtwP/lxpJ/XsUSdVWqsDKzQpa9FM6Xrt09CpiTZ3yODK08c485E8Ni/xlbAfG
         k2kIPQfu4h/ooszb9cDtIAPBd9zzzMpiw5MxG2gb+t0olhc+OLXRJx/l3bAnwrzfNQ4a
         i2EVIJYgcYLLbRjPXYGMs9ezGQB9vTtOF5kVy0n2aCRaIrPe0uOBVqRrzjePgUDwaAo/
         Ki0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNvXg2TmiDkefjggaK72YOI9WQzXJsvscLozqELANEVHEJHSlCNYqFWgJFqMAlgqSHjVDSJ0dubWp+@vger.kernel.org
X-Gm-Message-State: AFq9FYKuBUoHuW9dB598HzFOFLbIm8uIXoXrszCVXzNyvyd6+N4EEjvd
	4I9zN0l8ReBNRA9WyjeLI12TuRg1M00w6ZMMWn34Awit2nkQzgnw4p5ltAfGWBET/itDn47PNg9
	C1K58B1qd2Ivu/E6NsLZULw6BM9Pe0xiTohltHClqDyW65yI2f15shHnnBlitBuaX
X-Gm-Gg: AYBFou2gVKt1XAw+godRbdgKc0wB8ZIRJPsWw9fs1xQxU8UZYS8Qb/uo9ST20X07C82
	bXzOADuGGDJDKEihb/UoZnFdt4q1EZf5Frw+ATLgay19SjKQQXuT6cI3d5ELy2cg/uvQmuGSk8E
	G4rH1dmHaM1uW40Suey9G4c0IliRLLXBzle2hP4MEtOb125pJCXfmi5b0YW1a1QTxzvrA+E0Lko
	kmRMCAVdV83pNWL/M9Aj8n0llWNWRoe5YBS3omgvQol9kIU7h8vIhiKF5EDLRsUCIexJyncBDMI
	YwknUyFCndeUvbpbPk1wqarq5iRn64GMKBtd1DA+z8Rr5bOElOkqgqtr7kTd/DSGOrqz41Mdr7U
	uASEzhx3Dbw==
X-Received: by 2002:a05:620a:31a1:b0:937:6de8:b40 with SMTP id af79cd13be357-940ef913c90mr835632985a.15.1793010112238;
        Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:937:6de8:b40 with SMTP id af79cd13be357-940ef913c90mr835628685a.15.1793010111647;
        Mon, 26 Oct 2026 03:21:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm196226895e9.15.2026.10.26.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:50 -0700 (PDT)
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
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for
 HDMI
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-2-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
 <20261026-topic-sm8x50-next-hdk-i2s-v6-2-0bd654b8388d@linaro.org>
Date: Mon, 26 Oct 2026 12:21:31 +0200
Message-Id: <179301009154.3833661.9148622566622924374.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JC2YD5MuIOA9sx0NpsUNWZGDDwPM/UnizCGrAm4vkVc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq3ym2Q2+qpQ4Qr5hCKm2L9s98yTk0C02co+ca/
 3PJgw19G1iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat8ptgAKCRAbX0TJAJUV
 VsqpEACS1GPIBiYVuahAsl+I795x3GE9AmTvLyACnXo23Zc0WrklpM04UH8049/N5jvw7lNI2/b
 GZ8XbTtmzIvrNdnle+YxircfycSNBx/dKGvw/q1SvYQI54pNWVDwqP11Tc8EKVrB2rW1zVnDZgE
 hjNZqjQ3DgKFmzxBooRpaZknRIgngGWhgo6ua8YppN2vY/wXwgv1snq3kEEC39fIbHVN2lF2urY
 S6+zEGHPvWzjyg4GdGuV/cdtBRhvMy2Tva8+N/usKy2itYcVULQ5J7nYS435BA9Lek1rIv01Xvc
 3f53DjMQHwupuxjQUBoImeSvgm/Gvj0xY+bW+o7/2ktWSeX4T9wFk/6WVs6C/bvRHMrou6iGMj8
 eohplPcGg55DfACV/rE0JUC5Eg4yVO8GiF0QtdjKCY6Ycx8L6j7ghwiy44S9CuNpyfOwTOzxlnp
 Pu+G+nPNiMgoWCzyU+P7K07sDl6Ulsk9WqprL5MsNzNz9gjv4HtCKD6I2vIsqzN8vK3PUPUOkHh
 YTbu5kS3iQ1zfI1p4FPVFvb1030y3rIDDMDd7epkAtJFlXcliL+oYtqNyxQTo4X2AHCCsnOwnB7
 Mvt8skrGjbjdYsrzSh9fqjeZf7JwgsnzJcFni9AO3HcwF0us9JKRafVeQZaxxEaWlvTdedYUEkt
 /nE5UmVLSOVXchA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX0bKDSK7wXQAa
 1lYmmxLG6fzMMvrFeTeFes/zjO2Z6pHN+SHtlf2jiXUzKkIyfGJB19l4bQXpwEHvbBUUkawAKf4
 truBaUaAVdl8xpy8CwDkQM/+FbxRnjZBaqZXXCLmslxCYKdHKhSrFazQBo98eL+0z067ib8dKd2
 Mdd0koMpUYQiPn+5P3+ZIG+/feodF5bXTKZvano5ch7r6igsgYVilOtO9Y79+HNS6LR93kJNmx3
 UZMFO3KUyMZghlWAPS41uQxLi4V1M4VtbBF2kyO0V0TF+LOFLy4MednYBLu45QvjSj9oCDG5FbK
 bgpm0PQxx9JengTD36OPP3KjoQJnU2Kph3g1D9hXHz7r9fc7eksQBbNgSAyakqt9GoeFBaIiHAA
 eYFYF23AA5WTtf3tj/VLIZ1LajUHg6092X2Pf9FS8g9S1/t8aoWyuOX4u9dN6f2gMHd4Mdve2sw
 XhPjh/vWBlmrWlT+tjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX0Rk3hBVdemlE
 qJFiPuSFSNXr4GlHPxlNSvoOa/AaiYL7JzgHMPqCIBeNYWA6ZVmVyztJHJm5hTB0XfxdWJOTjVp
 nv81j6nnThQ1LKQlKLUKAJOJrZhIQR0=
X-Proofpoint-ORIG-GUID: BIV8QBByS9XJD2THqbIdhpEAH1E3YqFi
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf29c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BIV8QBByS9XJD2THqbIdhpEAH1E3YqFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On Mon, 26 Oct 2026 10:50:37 +0100, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
