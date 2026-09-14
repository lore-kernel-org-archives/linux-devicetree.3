Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354343A7F8
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382723; cv=none; b=bAz6JwptjfYp39Suh5ekFS3vwR/p0gCJvtiIalQeBCdFAJK+D8/BAE4S+c3zRiz0/sncjaFRe71/7hZmrINuOvSngFAUMeybAg5Uw+Axt8VVDSLCgsb+vkIZUwOqMIbI/o0qVa+UFlNJLJAp0KXqqyuNh4782wqQZ/tqZ4Yop5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382723; c=relaxed/simple;
	bh=eyaOqajrrwEoNmASdlj24V+fmIkqbU1OG/65Abo8pj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0UEj8gYUkwfnsgTxQJ7PIFxkcTI49zsyIFuwxrV/yly+6cUXJOLhpfFHHzQXrQ+r9GXKYIiVq9en/JHc4Hp6IHllsx/G33Mzz4ToXAp6JZXKIFonkqqU1CXBHIbBffTPvf91o7Ub2WR5xzToeHoFCHnxZ2Q534+DV3mxR1yy4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLhDkpKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYkr+qez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLhDkpKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYkr+qez"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nP0I773117
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oln3IkACQoy8k2yOA9M9clhi5W3pr4OikQviEiaDc5U=; b=kLhDkpKknrnvHjkv
	9tjdBeiJ14iXmL4hZWnaIlGbn817I7U3ZqFh4xo2Zh7anZu2UUcAnz8Ti+iVBycC
	kEuu9YkY0IzuxNrmOIJFDsTW5OkGxYiN7LqGgkrCuulQ4SP5YYDwKQTrQjrofocR
	xpw0Y7xVZNCuMUh+lAqDfXHLEf1XD2AMMb4YzrqNz0uMQzdqMg9bEvbJA6jD1TCD
	tdMd/Y/lXs+qrmf3O2+nyOLqOi+cgcqO+5zo/0Wy+7agu7Wys9uwfN0VEwtK9+uW
	6pg9lgAs9AEspXTAJtcHOIo7LgxJX6qWAp28PufNxHvjLC6oq0BedRYuewPwOqk7
	nPQNbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrej2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so85982085a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382714; x=1789987514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oln3IkACQoy8k2yOA9M9clhi5W3pr4OikQviEiaDc5U=;
        b=gYkr+qezaHSEmzu5IeBEGJ2vUH5aI5jV7bg8MMweMyOGvN28rKApSQtWyghdtrajZ8
         HYqCIzNrzQqAAB3YAJ+Ph7MHJPbytrjocVT2oUlJ/8mhH3xwfN/ys0qrlbfv3mXefHLL
         gt/z0dvRBjLdxk5PDLdZALgAeWuTVJlWC0j88DUQ+nGVwgP938RABMw3Iq3m2ecgrcR6
         f8A+FP99NLOM1K5sCFM5iqFeTAFdkRODoIV8FLh44MngO0ArOezxMJHdVih/jTK1zXtx
         NPMV7s2Qmu2KgoKvzBL41NS++YmA4cBXJ6ZZ4Z2hAMQf6fydAIdp/mf98jjQrNMw7IJa
         igLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382714; x=1789987514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oln3IkACQoy8k2yOA9M9clhi5W3pr4OikQviEiaDc5U=;
        b=ScxXCGruw3kJR5Ui6Yv3M4SjGnNXRBg+F30cBZn6OqoOHTjpuyz0XqCLBxJcIONNkE
         nCa38gD0iGUobSTI+pdb2HuhR0xBGDSVR2bsztygues13n2kxFFEz/CRGC5PP+c0aSwr
         KKDCbRVmlnBLwIkCMLT6irAasGh5+QvSMy68tyxFrDzjNQRyDFni3fThGkfo19R7YtPG
         hs3y2GzQ53HnUMtfn2W+6Q4FOQOtF3Fb4z0hkNJgKVDfGXNwkijsghex/41q8DEVoNvA
         tWh66tm7w8IWUuHvcghO1Cj0OsSWY1tLyDLmgT3WehKF3hUFCW2tAaoQEsfvh5KlYaIa
         R8lw==
X-Forwarded-Encrypted: i=1; AKwUvBwvRK90UzNgk2XeBK79hUYVixDbVZDHJ9VNjzyHrUeqm+L9fr5KOO7u7RHWLOLuAxOCU3N+b+AL2e3j@vger.kernel.org
X-Gm-Message-State: AFuF++mqQF8buMrgqnWxbhB73V5HGIYWDOzKNKl68JxAxlVx6/gcQY84
	UPpnrw2N5u6LDe+hRDk006741IXskn4ATvcTlx6nBOaNyD4AN9QVd23+z76mMOKW7n+E6A/oNJN
	mVHW0hohchUwPijY83h0B7RuxrR1SkuNZaz8lD6gC/HOpk6Ema0RE/RV/hC2DDq87
X-Gm-Gg: AYBFou1tbLVLLlmrg12ocFoipBe5k6TUgNe1hDwzVEjYBNTcQ9dnElGTO0Su8jXqrHg
	nNwNRK/62PWpbTC5auOCa69cQUEr4DDVCkJQ9A/dS3C7j6uexrNPXLzXPuBKYd2rJvkg+jW/s7V
	hDrK+n8i8U+hqL+Tc0PYqNNNe8b0/UGqt2XX4+giHwHqdIc2BHAKE85C74QvI5kFjFiY1AOZBWc
	anh3T/PLcvuaYijDX8Jm+fGhdS2xrBISTYah1SkUMWOAFTQqF1yDp3bEJdMslk6UF1QsnTnrQjo
	9hgRjz0RAFe/+fo4C+RJ3ZjhbovU2zITH1ZHdDDTKMeMB/PSmzcZ1RiX/2Gyvt2tX+6idoGrmLz
	wTaPItI3KWWhWQa1w29Fkaw==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr207717585a.4.1789382714403;
        Mon, 14 Sep 2026 03:45:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr207713785a.4.1789382713879;
        Mon, 14 Sep 2026 03:45:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8528sm4027243a12.5.2026.09.14.03.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:45:13 -0700 (PDT)
Message-ID: <67557983-fb7b-456a-828b-d9c73ce1eada@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:45:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850
 WLAN support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YEZqs0_IG9JUz9lhJGx7mV7z_WctQCMi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX0MYdAA+wHsfp
 ZiVWuaF3Q/9izT15DmAAED83gbqqq01HhPbl+tCfWBOFcbnCfatlCUwzLK1i/bxqW2kOQQ7El3G
 4rigQETUi7FDD+fEx9zEwsQ5A+OawMc=
X-Proofpoint-GUID: YEZqs0_IG9JUz9lhJGx7mV7z_WctQCMi
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7d03a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QryoO0P2UFxYqXaw9vcA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfXyq7phbXnU3f+
 0g8l14MSE984nD2ybYhWIh/rL0rYfzzdUKdyRwc6Ptv3i1HqBQwBw1oTBK9MpkrKVkucCE7WbuM
 wSwPjrRnbqBs3QPFdG97Bgujzt9EpR0H/WKkcTZOMUTa9/DjCR42i0jmreZBZbw6CWr1tyxYcW+
 tEwqFDqz5Yc/W/J23hQ27zG8bibJWf7VA0pJpHY1PvOoUUvCR2gpQP0UW/6014RzECPFoKqqkdv
 cUOjimFvH33xX+UZLv8dwjfd6dZb3CDCdCqkAJCF9No2a22uval769boJvuFjDuttVJapYuOYiC
 kxsak3pG33q4G3bCg0LtVFijtJDonkTfRKxdyz1gSxCYHLt4PfCiMWev2oK3aYPwB0IjRdw9rZQ
 uVX4qOobnZdFJFBT8mqwaxLnZ7SrL+NEbXAGnRuG9vsvY0hZ4qUJJ8TNxtqyXv6oJsftzvAWI/P
 jilqaDtMHuAsC6SrhfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
> a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
> PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
