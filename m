Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6E444719
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317711; cv=none; b=WjcepdJCfwjEsic43me8mhjDtYJfgvVmg7jdhN9obdbWrsPk5yFB1/x1XFi6mXEId3Va7VjZwhzCWMOtwsWEIT31rltdHIRVaO99rEfioNblGLF8CKuZJ36+qrxFgBdH1T0rqdiIMqanCdbLAZfxa/RVq1wHJMgh7nbnG3+qRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317711; c=relaxed/simple;
	bh=gUAg+DD0KaHOsFRq4/7kFj5VC/oamgCFk3ts8c7doFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2lYCf8kDNmMEk27h2m93Q4eaV4e0U9850R0UUZwK8OPgn8aNQM94xHziMxD3iiHTk8SJ6A5/gr2vLUBARmGbx34oNjdiPstwjFKRn/rfQGlr5hb8VbZGXwfJIQYi5fMhrKMK2E9j9xdiiH1gugnt4QqJlw+T5fEQ9s7V+3xvZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHVBdnyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajZdl+DV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHVBdnyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajZdl+DV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f2Ya1088701
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSTtkZvwveJDCCpOzg4zgb4mS/QvLkyal6y+qXozD2Y=; b=fHVBdnyCizBDqg8A
	ujQEp4EBS3XyFM35mlNNmZvPzWc8t9H17BRb/JCM/7sqSaFTnS/kJr+tZ5sNvbfc
	3KRT5qBXBuIXztRdFAGQsNz8HGqrsFQ+MpAStlMM3y8fKkh6S04KT+luE3Gw6RKF
	VJC0LP5zrIdO2TBzBYbly01Tp41xNMiArWh92TJMNFd7xmfh06K4E73yeul210VP
	PTpYA8VwkolQ2vkllJHaINmmIxRv7U0YrHWL3Dvl2lkC50y8u2pTv14a7gvwumkJ
	5QmMOePHWTG0NfPNLQtrPpbNaTHN1IAUYQTFpTu3pSfcNZ98m/dTeO1wJRQuaGlb
	MRz1Cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5saj34x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:35:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9d953b71so1044921cf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317709; x=1785922509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSTtkZvwveJDCCpOzg4zgb4mS/QvLkyal6y+qXozD2Y=;
        b=ajZdl+DVwOdYVXBoB1TkcF6Z29nTc20ViPkuRg7aUaiLsYhYOAKRZr52LNxCleYzpe
         KnwU5bj5/ZrxzGPyV3in0th9921ABOkSDq6lMKTxE/FzKBgJmImxBRr79pmt0iENRQC3
         msCkgbda8UZYkQB96CtdELoPLSqY4aS3U3xIVozvYPfdffa6tu85Hbxh1+XXS2tEnkZj
         amfNrJ6SmIzzTtSuKlfQij7K3y7+Vee7+hO5XuZ2u8Hiy/AvSRbOybR8IKHNXr5I2dnq
         Ls6lQRaxxEVCguAH9cDgxoT5gThbhcLqpury+47AyUmBE0j2m2mV9fPUMolYfnj2LwaC
         gEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317709; x=1785922509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSTtkZvwveJDCCpOzg4zgb4mS/QvLkyal6y+qXozD2Y=;
        b=CZbQ/pafW22/HG+byGhDtuFUHtfv8rmI/K9t6WoOxV6q4kvnZ/4usS6js0zSt53dW2
         bcAk4Uq8d/iRIjykBh1fXe+OLotzWaUJlm6YHvZhP0PI5C4L6128RDmioRvpIjwAWsc7
         qtu7xrDSHyH0KcQa87sOdbzraDTw88GzB3RTeR6EYVg5cZcCvhYW8HiW2glvDDNxbzCF
         uxWM+7hzCdd3+B5EpIKnVnZQ+6nNTxqH4emU7WKR4MXLNWoVSyj8JsxzMhjT+q82gFJ2
         0liHeBD03+VFlINKJmp7AEFmO1vNzsNGsvA6AZ6vHx9EtLBD9OVk59BSCZNMer8Hq92j
         CsFw==
X-Forwarded-Encrypted: i=1; AHgh+RpPcoSTcUJatDknjOF++gyXBC+3g3zM0wOfZFKhUNcjm1tTahmsTl385Op0eEaflOuSxUlZdCQFU+OZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Kgl6DB3/2iunnItp0p9UjoQnS9nAQQqwVWvNKHxQahevbK6P
	vP4prWhgpQ+yzody8eIf3SDRMvS5TP+7MnmwHG97lsgNJuIuf1qJUSiCq0cvDwJ3y0j+DbL4I+5
	KyU0trOMCRoYjbFRX+AeJ6xtu/WJXT3ruySwxchKp1gVgMzvD5aOTrpHcX3yiQB1b
X-Gm-Gg: AR+sD11znEv8565btMComHzMKE22iMrgRvUMobCxl3UdRstqmUZzC7r8TrE8LusXcsC
	J1Yvca7A2cvuGYf7OSybnmOJ00fJsTt0jOw1CQ8Rdpp2c+N1gd3DK/SoROyAcRct6l1NA+gQBSi
	VPze1uk4dY/w+tE2bi8vJiflKIKCbxATF7fgAQUcwxUWeXAGqw62Kgj5Kck9J3mbsFTFK0aev5M
	guxavuE/wOb+VhFcvhcvWyQn17dCSQYjpQyNf5m/X2PnaqXJCdcapsG1GxiEzKGjYLIgIDZbW5c
	up9RL9KenL7q2t+mLY6MNSMLjLzCAIKvLQslSHD+xybS56Lm+1pt8kY6J8j4sMMKKqG3M5WH7VR
	lDHtKThoPgEKfAjn3IdqmelCM
X-Received: by 2002:a05:620a:a21c:b0:931:10e:befe with SMTP id af79cd13be357-933024869bamr417312885a.0.1785317708756;
        Wed, 29 Jul 2026 02:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:a21c:b0:931:10e:befe with SMTP id af79cd13be357-933024869bamr417309785a.0.1785317708225;
        Wed, 29 Jul 2026 02:35:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fabc2fsm87620566b.50.2026.07.29.02.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:35:07 -0700 (PDT)
Message-ID: <bb3ff752-7e85-40c2-b9ae-4f32469f1c48@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:35:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
 <20260723121516.2341900-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723121516.2341900-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uxUgzHjJrFSQKdZiS58QVfULHtXhI584
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69c94d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i1AF-yj2SoNdfRuAw8sA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uxUgzHjJrFSQKdZiS58QVfULHtXhI584
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX3sGM78SGZFux
 5hVHmdvWPlrmWYoPwirdKc5SEkpn9PicqhZ9s1F8N/+yVjTfXRoTAsYzOZjU4oYMfg6JTjn1elW
 NmqAyqFuo72bpAqASnc2W3/0NDRU0dI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfXxZzXFY4NlfgV
 Tdvf6JiKMS+IO/exMKo8lhoU3IzidIgG1U+Jsh/SUAQV5OFwkLhIynYhP1fKZzpKJ3dFcOyZU63
 7IRmzQTCQQD8ge2/Vf0PFpAGxipDPhzwt9jdr0EJ8e9+5X//tary6sBFz7EPAxJISh+jT/A4ZSG
 LYmE/yQqmQF7r9AU7PdNAemDtmVtQVvZzQWvbCoBH9rRBpTXjdCepfXnz45djeLHDHZJKXNKYYb
 QJezaQxwAMlHJWY4/eCXYUzUtKp43d3KfKpIbOl7GiY4ypXFLNVFalY3Zikoo0Qhmf+RQB3T/Y2
 YI4iwHTEisU2TkJVfHV5bxao6hYMObjX/S9dBJP4GcDXHwd+103nJk8eCaalfV6+TNyWsOhTiiJ
 8ldrQMzrgYhKozqti2ZbO/+oCVU8YkBQ8CKDa38RIcQjx2ft1Wcarq0j6PZX88blYkCDxCLPB2U
 Yper5xiLJL1Ftp4ltmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290078

On 7/23/26 2:15 PM, Ravi Hothi wrote:
> Enable the sound card on the Eliza CQS EVK platform, including the
> WSA8845 external speaker path and DMIC microphone capture via VA macro.
> 
> Enable the required LPASS WSA macro, VA macro and SoundWire controller
> along with the necessary pinctrl configurations for DMIC and WSA
> SoundWire interfaces.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
