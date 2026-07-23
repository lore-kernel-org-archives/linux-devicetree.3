Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF143FD21
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810309; cv=none; b=cbDT4k0n2B6pcNuNYu0LBEMzWdtNVVwGzrtWpT8e+sJC1eTlpfNuh0lXG+byPdJg7Zvkd2tYutWkVpjD2l2jSKVaBXN1j7+EHK+EXP+g3R0aObzu3fIdrZyHb0ruD0LCzN4sBuDhIX2ZAn4yjymC7A67UkP3cuT2mtOwq7HUkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810309; c=relaxed/simple;
	bh=pckYL1D3CfZOB5jjUCobea/UKWSqfsWHwu4vQOAFNOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQqwFA2HsaIuIoUwVlIv0EX66QXJYiJgKiPL8KPUDPLLC0/pZ0NpVI6D5dAX1jVpEacx6dijW0YtwFoln96eKoLmiXjnjG9fiUR4twxgC8YuIrSFzZsKRtz9x6eMPplllBA35m+780UUUSG+biwBUNWWO/MEEFnZKbNv5uTETz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUG/9zzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLEiQKNx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUG/9zzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLEiQKNx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qb5U3606118
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S3xhgn5k8TZxn6jp7Ofug3EkkneSnNMyQ6wGDXgevA0=; b=mUG/9zzszMxmHt6d
	EtuEty8QqN0Q9j/KAZ0kh9Z+LaA+zyUIY8WD+GInGfLJNaYnWi/z24f7MtaNadas
	jTJhZscOlj1MxzgBgpZaOWssGFJIBatd6IF3ZKeC7IrxUhCMGbQ0FRQt5LX30TzE
	MLPqDnLNsVX9CeNZNIMMmEq5LMcZzsz8Vmg01MuQoe4iKjwYTpDF4Z4mZyhEI/x4
	rCAZK/u4aWA+fNSx/L3L1uzkN7nc9OlcJP096GXKLNoD7ekRC2Atut1y1R0gFmEG
	6s5s+yxmMtc1jgs7DRdiAFnmw+ZzWph0Fx25qMEHBTu4cVJ3P8+wqzObuD9ntMLQ
	6BEkmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qhaah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:38:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so1550151cf.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810307; x=1785415107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3xhgn5k8TZxn6jp7Ofug3EkkneSnNMyQ6wGDXgevA0=;
        b=HLEiQKNxC2qjk63A9ieDdTK+ErpIXTQDH9Te3itjAtePNtnLEP0foH/QsFzlUkcKD9
         LgdSzCPjsHp7M08jCVSUGPmXJwQ3+EDqgynEBvySGZDqllXh80TVrbgn8DpeynwubYBk
         sUTu2jU2kXDNVVJmUc6O643te0xcHnIC/3TrrZmsD30J9zh1csndNHh6iMH63zmmxBr2
         LpkREhEFdEksnOul5Fl4RxeovLmdF7sVqTqlooB8QCzMp30XzvPi7LTHVUw5/ddz60Kd
         MTFZY+SEFnguv9zDtjkW0l1NsKXFpgqFqSdPg9wVKDZL26b4ClRoLWYCei5eEQQGjLnJ
         4sfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810307; x=1785415107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3xhgn5k8TZxn6jp7Ofug3EkkneSnNMyQ6wGDXgevA0=;
        b=dlevvOFSXFU4wYfgoiflYrue3Y0iHyUrkWDklGfbUdnMc0jSyN+70m5HKgtKeWdwfi
         isG/NkW0RIjzoJFTt0MrSwPxcM8hRbPzTaDZDCAP41QIposbNNd4y2GHHlP1omS7OKlb
         4mtYwNwW5Ps50B1faMQPt+HcJYqMmX2t/B+INjhrddvLOv7/4DaLLgCDo38AguF9G7l9
         O9F3+px/vhs/7oA58kntnB7sl6aMjd7P7Rgc+SbRcZOlQIVhLZET6Sm1nSv3YRku5s8S
         asjLHSa2ETioY7PgBf2sQpW/Jq5UdmnV/K/Hocb1hykmEJlx50+Nqtl1p7IgMNAxKKkQ
         gwtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgEtubx8DALkzV5EvVKlWdsf0mPeG7I0xZGrYsgKH0P5bOKBCYPjsQTtyxU+MOYTptUCJFMd8s3hpe@vger.kernel.org
X-Gm-Message-State: AOJu0YyVD1MsdD/s98Ic1fLOGH8vPRN4DJs6HujL+stRAXGuPR/4fxtP
	sx3nLrjiHabFdkiYh6xqTTDtFtps9Yg19Kyrw8spu1AcreNtDGOcCIjeRLL68EN+V+QoKdiT42l
	SpWHDuIyPrYgdeTwkqtOKY2xfDQrqRoT5yRHIFzQavO6HJy5fyy3JQyJIO0xiXj6x9zhepRmS
X-Gm-Gg: AR+sD12Ycsmv/vlrRERzXW7UpL+JcBqo6PvufWZPmFO6E+hegqVwhailZiE8bXrZUAA
	y9pK4UuGvdnVx1hmBj1eZXby7yzZ/2fa7GzqvGurzDsmrGNg9IjHHmNZ4hatlT9oFWd43JvucHa
	tvtBXmKC8w/LHn+xVM8qU7b/ZqMFc7BCbMNZuHLLJPB7PAZ5scG7+rCiN4ECAhBCtIF/c1y8OzU
	aJ/qNzxobp9y4ZiyYE3BDfAdSL9yJ69VI07iGRWP09ft5EcrRW4tZZkDnsB5FqdqMXMS/dPc01/
	Su5IrzNhg0pq1fKdSFe9eeyJ9Z5Cgz3UgitPoy8LidPuulR9P7u+gi0WrXq4pV1hzeI/gzp/Tt9
	exfFCRFse8Zepp2DU3V0/Ocme
X-Received: by 2002:ac8:570d:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-5283de02881mr20141201cf.4.1784810306682;
        Thu, 23 Jul 2026 05:38:26 -0700 (PDT)
X-Received: by 2002:ac8:570d:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-5283de02881mr20140761cf.4.1784810306121;
        Thu, 23 Jul 2026 05:38:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a76fecsm224033166b.8.2026.07.23.05.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:38:25 -0700 (PDT)
Message-ID: <2df9a5b2-1807-4b10-96ce-4b447ccf7b49@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:38:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
To: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX2WV2zMfvBcwW
 8e4AL2hfCj0748P2Z3Rt7o7c0CAEqYQWfPHb35v7/Ln+04IlMTLWk4Jyychto7tpfg53vur9c+A
 /bk7tPIAOpa8i38+XQbaAOptuXnDQA4=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a620b43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=b3m_QctH4RwnUCLtgwcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zn5E_MjJAVsGlBdaYUhkOCtDiV7lY912
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX6KUctXoovjdb
 gi+rG4k8PfEaK/a3ScnoKN1eXI7lk/UY0V9mjwHHCfYOnkx8zM0zuZWxXxOovg9EhcUAhA+Q1NR
 x4f0Y/Qb34+F07aM3kaY8CrwofwAe4cU496K219OGRwTPY+oVNqydAKGggJ4T8KVNlELh2hTnen
 pGK9TiUe+0LG6ui0gQM5BFHv0e+gvjUIFwjd0T0RDCZtDCf9uf6k6eeSyQ2N79dVfE8Kx4t6SyI
 ukNg4haryexRodbpQjOkZK8ltAtnQv+l/T639xt4RhPV2xBBqrzYW1Dq04EzoeHzFPDiDV46CJ7
 Fsn1a5CuAyOpV/lBsXvKa14Ht8xyoQVMibpNBvQncbU24TtWmn+3ZcGubXPtJgYcm9C/MLymXaL
 kboxfupYVs1efp/TCCuO9TKsSp+MTN+kwz/oaxtNf15arGjogbhAKNNMeqQ1lp03o7LfaRS8M6k
 Hmx4EQQlzKcnZl9WesA==
X-Proofpoint-ORIG-GUID: zn5E_MjJAVsGlBdaYUhkOCtDiV7lY912
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230124

On 7/23/26 2:31 PM, Rahul Samana wrote:
> Add the PCI class compatible to pcie0_port so child nodes below the PCI
> bridge can be matched against the enumerated PCI topology.
> 
> This is needed by the M.2 E-key graph description used by the RB3 Gen 2
> Industrial mezzanine Bluetooth UART overlay.
> 
> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
