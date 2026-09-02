Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3F4A99BB
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366386; cv=none; b=D56yK8QYqSLRDUdtpmbIkTgXuTX7iqZsxyryRDALtGrv2BuuQvsFszoynFQk9q2d5DgUgh41wqu4O6w/TKnAfMBqiylBjlQph2aecOFz9ixssuY82S8mUWds18+36UG9gZlyQVmgyoMlXxe0n3TqR0tRWMrSSs46+1weLqnlsxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366386; c=relaxed/simple;
	bh=XoDcH9GORxw+oEU26TAT7hJCzBtymOFWgvnwiz8EQo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJRYplrva4Un16vwpETAUkBY+J5GS/tkx5sigVAjX3iZthlGskehzGRkcoDrag2lqsTa2WcqNs0aJ6qeFhogTPDUVLQLAf30Ar+YmUPpjwBR1dMFJfnrzXFdRf8JtI6O2bEG3jydHDXFc33hP+BqnIYQGoquDKM3yBl1mhSKS1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIjQqgle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QljyopoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIjQqgle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QljyopoR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZDgD2177140
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 16:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=; b=TIjQqgle6O4guCDE
	auFxEP3DJckesT2YGbS3JONg42uoqIU8IUiRQcYNjxU6hjAJC+LTHphwXW60/PdM
	C7zrUWr72yuBeHxkoCv/uuotiyDtxyItQPDZadi4SlTDWj+h3vixa6RoU0krFbPj
	w6wsxZLEfqGO8oqG4ji+RlD3yURmyiFXc0gB0cmmEfTBQAAoxSnJNKGOfxpC9EAw
	ilxNG0uEtnl63HzFSf9NKtvNDwRTQ099s+PrljWcr3Ec3pXspvuYhOTKYrVY/h8k
	xxwhMwF/cOE27mJZZJnNrFv1FmIywqVp9qrs9H485Mbmtx5+4v8pf116nnsZJJtC
	3uqauA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh8qb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 16:26:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso26475085a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366384; x=1788971184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=;
        b=QljyopoRigdPF0Ta94Qyt5BiUIwuMLnIBLHK7TLuHz5+ai+2eXMENx4y8/o3COybHa
         gdB0kJ8Li/RYJS7VhEwSreV3aLoSFl7XEA2hL6grI1GmYV34xjSrgTZbms6wC2v/z19i
         8wsjI0g7irmAL71Ar8MfeWXnRoiSj0rbarMe5W86jXLAlIlcAGZWRLRjkENENQvcL5Lj
         hQMIRv0uXeI03u3jhozHj4rQ5lEBI2zw+huPrNNFMCSWwWHloYPfThXWKfwkRC47mDT3
         DVXSdQSNxopx7T+i8cpJWaao1NFX6V4sC3bITusyXbq8RQJRtnkx5ZeCiiDdHvHiCZMA
         Ox6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366384; x=1788971184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=;
        b=s6Glx0pybu5usG8wn20KZIElp1oY8TlgMFT8+aDGPNWr4eWLcXL+71bfPRxxVE8T0U
         nHryv0NSb59KvmDc1Eu0FATPOBwq+8ViCcpDoV+Hq+BfnezbUclOyNtq6JoL/5EeMTwo
         rDfm1kw998Ee7JYmBXgoe9SObLiasDb13slhOBHDPngAsKr82Vn7+Hd8Gix3fnwuaHs5
         v0xpdAzTnp3aPzIUqWADwBuqKP+I3rTMTAKUwJ14g7UPWJqbiKRgor6XIy4QZwo0tOkC
         HUysTHrsxiD5VC07AmEg0pY4kgfegmWWa2MbopepoPr8b1RuFgbycAuBS8yuluz0xfMD
         FVhw==
X-Forwarded-Encrypted: i=1; AHgh+RoJNMk8it4x/0g9NN3rbNAFJkbIEOwj1GXCWDQpq79HuI6X+FbObVabOwonQPxEYRq07VA6Ew64LuXH@vger.kernel.org
X-Gm-Message-State: AFuF++kqrNthC6V+aiac+fp4SfNMlDqTEdda2b3cmy5a62qDE7aBUGz/
	pnPHX3i8Uod/bcAcuBXCCgKotkoLSgNH1rxMia6AWOM0P7iwOmFDzmUWdby5ToCPG4R/Ctwustz
	SNgh+7OW1Ico2vIDHNCnj3yAWETesvDtlaZeMVR07ic79AHjMKbcs5bsvGQyDJY3U
X-Gm-Gg: AR+sD13e2+CJUF/ttGwZ4A2DiKdBPIb0AUaaKmfmfpm1y/mYB5j8VzJYh1wPCM9tytG
	e53X51+1d1UtOcYK6tpvmziSAP0N1BO2qyy6pstjDDvZyVOBAefNWINOPHyLmNNIXiikQHh2xCL
	mMoIXjQHx5sxxGvOfvLRCQiPKZfJMM2R5HNHb7QSBVbGO3SfgGcwUhdCLy/Q0Dw4jwORy1BpSkA
	5F38OLLQbz3TpjXkylbtCQRmNedserKMitgC/xV+qjaaOyQLCh9l48PwFwFZ6uYefXg0uLZJEBA
	MaU06aEYI1xmLB9Ktd+Rl3iZYpSGa/TB+FjKBb5Vvm+T2YktEh4MptMGVyzE8QBY/Ok7bHTcHVu
	tKO9RAsIcE4GAgWcAHu0oDw==
X-Received: by 2002:a05:620a:459e:b0:934:95d9:85fe with SMTP id af79cd13be357-93960faa235mr438361685a.3.1788366383578;
        Wed, 02 Sep 2026 09:26:23 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:934:95d9:85fe with SMTP id af79cd13be357-93960faa235mr438358085a.3.1788366383062;
        Wed, 02 Sep 2026 09:26:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d041ab9esm160010866b.53.2026.09.02.09.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:26:22 -0700 (PDT)
Message-ID: <d705aa10-0729-459a-aaee-574bd40168dd@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:26:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e4Sjupe56OKuRxO83ilqp0RIB9OM0XXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX7JS0OkPk4xEp
 J6aH1hfT/rb2KLkUuCJ05yjeVv4dRswzsMZ8YMbOIrbreqP/6bWjebevSkVVIcS3yebgSQq2dOg
 QiZvCAvQnLnUHxfcIttdqwnIjsP3T56jHk/YOXd8IJpSZ1DRiBIDUdFZ1RxURGXDhkdsitnI5ce
 0PUGOJNdPoEubX073GzAm1jrg9w4dmyPVV3H9h7s/l0xJzRFh6VvmVccUKKOThLlbmuMcuc0Ofg
 Jh9zzYvhzubKMMZaJg7E7UMSouNTpVmlLEDghrc/Uar5n2h1lneZolPZLIq9jN9KESZCo0xXWdM
 UbRgeyaWD7zRA7uJ7IEpTa7x0lSKvA4WEK3iB3ZieIrlcFQA0zDQ6T6s0YI+umcLdDmuWgge1VI
 3WMqVUsr2eMocRIoz9XcXgjBfNcmQOUfNtLAss574rWlzgSoGQX3gMN9l8S2zUsUCbTboGgnG/I
 u+D5AokuXma3zUq9NdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX5vNFsadBshf3
 l9U6YhKQM03KGFbCi5ZKBWO7iongjPmd9xk2Gyz8xaYC9Il/It3PboSiqRlBV2KO6GtTFBvhEyo
 DP6reWaxquqU8XP60WDkLMHn8oHZRhk=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a984e30 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=foJT35fSmds2pDCHF_0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: e4Sjupe56OKuRxO83ilqp0RIB9OM0XXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020145

On 8/26/26 1:24 PM, Monish Chunara wrote:
> The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> and conflicts with SD card operation.
> 
> Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> with SD cards. Simultaneously, add the property explicitly to the
> qcs8300-ride and monaco-monza-som board device tree, as this board uses
> the controller in eMMC mode.
> 
> This ensures the SoC definition remains generic while enabling features
> correctly at the board level.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
