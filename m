Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F63388369
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487771; cv=none; b=gkZglJgC3O1x/VGWFyeHsUNR3UKGjGMzv5YDn4dNrKmuKSJCki71s9Cigd8EUVYDhh2BeUCL/9L9R4DtrvDxXnHFyDHzSoSaSGNXjwCy4or7UQ6gimk+aL2JjaGipvkWZEL9T2IQPQMJYS4DaCM6T8hm7CMV6HtXwxybffXEV0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487771; c=relaxed/simple;
	bh=qznWgINjW89HZ8XKIFLhN6m3p2kCb3UuuAC7xhAjnnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfYFA0wo4oh2zQVRE59Na/VMBJhQOaxX2hc6qF4C0KjGFahGScHv1hFECJzt9OX0t9s8eLl32LhCXaqgy5tnfhIEj3TyhcgbmOADg8Rry3NOAAVpAA3jZXXFsrzSNNy/WwXjiij+wbSlW+pPUBM8D6OFLnt1or+PNlmaC6JKoqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqhEW8qK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAJIRb/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqhEW8qK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAJIRb/H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF3qIb3976035
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1vg18RtT494U3bFpv0heAeJOQn+0JqtY4stHDRp+6s=; b=UqhEW8qKS9sKsVcC
	XfA59BwtqBqPIdcn+JE6PXgTAhbq+3mbc+NJ74H7dGvMThqLoxGU23oZxnbE80f9
	BdlrPmYgA0nBwr/PA3MWiPnpslXuplL6nI3DzbwjcJZKq9AfUYoxNfRV8dCgZtk1
	0h9ABYvZPql+S5rpBWLg2LrULClpJHAi5m+p8jounl8J5J3LLDclSaLW23wKSlE0
	nqaIOLK8fs+AU4IRpP7fpF3BaTRUcbHQstR4qc/inFov9i6Otg4gSTa21Pfrs2BW
	S8PU2erYH7irXUm2y8K7skaTF/cjsSzY1joFJG90Hid+3FysOFUVf6XL6n9pifiw
	HHIbBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ups83fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:29:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8adbea03so154491cf.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782487768; x=1783092568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1vg18RtT494U3bFpv0heAeJOQn+0JqtY4stHDRp+6s=;
        b=WAJIRb/HnH5T0Npcf6wfogtI5l03r0l3LZKxK5iUrEGRepJioU+i0D4k0dAiQug6vN
         kKV35QcGXbWNba33XgnzpjPYdKK5HLMaWw5/H7Y7EQiIKbTf5UC1avF0tXMrmsdAq2H7
         66DsGn1gFcyzr/rmWaZNKtjhvrAnLDG2GKL+JtdsMaKcpetYHL4Rj939bznUVnlHzxLi
         clPhtSojLGgIhsju8pqLQhDuSJV05+475Z8VqekhgY3haUxGveH/c1gGvP+jpacgfUmP
         S9bGO9lpdosp9aBexbJ4x/HjGmhadWkQYJS045e1Bm/sGZJ7bxYcPVDnp0Zbt9OqcrT0
         zH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487768; x=1783092568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1vg18RtT494U3bFpv0heAeJOQn+0JqtY4stHDRp+6s=;
        b=rHMezzlUFe7ORtLqzxlcvASOGgXzeU8u7ByEQfM3JlQ4SgvyVd34gg1HSDXHcXGNk5
         volGXSpZFjwC6If7uFWnTv4ctzQD7ioFHSEtubTqAQdRtHZ1BhTyQ1vkvi+UsSFC6+fg
         1RG5deAqi1GsCvmMtyvnuSe1bxESvfNcenDz0w1UCJ3Y8hrWgb5qVMDpE5hUYV3eEdUI
         e1m8vtS8nSORWNglmRGDTdJnliwZha3EeLSx50+SOsyaGUDY0PHSz+yxK+w1PrP5SQiw
         obifhGGh1Fg27tgkr8396IOkvjF2bf8+TKZo6cEvoH+Q8N9U2YMLbn1jc9ldGB2T+fsv
         dPKw==
X-Forwarded-Encrypted: i=1; AFNElJ/D3KYcYav7+puGdLsaYZGNp6L+vD2v0RCSljlinLJsbVMmQ0oI4ANHa92IPQz0RizOPhylI29emnIk@vger.kernel.org
X-Gm-Message-State: AOJu0YyiFBXZCFfnYyBXMJxQjAy3/hZLuj72FbsIoG+eAsf10Toaqqow
	Jhaq7LuO4PA4gnlgv5Od7AkxcpgFKVhAiayd3yNxMN1faWbElMnxRw7OeDTnRHP9cLqqxZDvz9w
	c5fl+zKpa2VULnPrZqM8LdEvQul8KVntlVgcMUfsTAdErTg4FnjwPnIcO84CZHsYC
X-Gm-Gg: AfdE7ckrBHWjNsWmYlq3lB9E+ecWOYbx3fkD88WjBTwJtjbn0tiwFPIAm1/zy8I5vLn
	rpdXq2993SsSxBECBercwmbHlrADJUzeAOB40ILQXToEhIF4zLUg2E650LCSCEhx0WnzmxVVDST
	FjLpKlFrKPfsZB3IxoQQH5IDNPi0jA548yTHKXBAerJ9AxNh4+5/2MC8r9Xc3ad3K8wjGCoFvm2
	G/+3Clxy2TPxhhVcODfrO7Of71IvaFutR/EF2e6GkLAnC7bckpEdiZrtBaa0tXOOXexyKyk2D0J
	TxFWQ9RATOBAkD7fHQyPB9XzQu9dUu2s03h+aQR1odI0/2z4vXjvgV2zmHwfEYnDwIVsvIVL8OC
	tV8/mnMC/4g87AOCRhn2Jp6pt3VPC8XmlxLs=
X-Received: by 2002:ac8:5e4f:0:b0:51a:8c9b:6493 with SMTP id d75a77b69052e-51a8c9b9492mr4776181cf.10.1782487768411;
        Fri, 26 Jun 2026 08:29:28 -0700 (PDT)
X-Received: by 2002:ac8:5e4f:0:b0:51a:8c9b:6493 with SMTP id d75a77b69052e-51a8c9b9492mr4775551cf.10.1782487767667;
        Fri, 26 Jun 2026 08:29:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05b62sm355657266b.41.2026.06.26.08.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:29:26 -0700 (PDT)
Message-ID: <8f45613b-7046-4a68-8023-8abb8efa697b@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:29:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
 <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyOCBTYWx0ZWRfX6CsdlJEZJ+V6
 yAX/OD34+XWLFnd1UK57Y6QlFzTWLRaGRpXHAkCGCdgDgAAdHpibNdcfLwdN10KTJfwlULOsaRF
 OEwPPJ3hikdnNonbVKtWQqmKDcmavFOFf8JeBGhYq5/jc9XFrAMvk4Ycv3VbPnWjdFxkDdUTcP3
 P2tJSJ7jcaWIIwdkeJp3rjEMIhH697V9P4TrOiLFSavUm2wZWLFVyTXM18YmgIHBX3pe0O/zq39
 sjLNuC4e7nieK2JP1mn6BmMofqVJkn/p1OYuibLn0aVM58IT6NTuDdD9Uresf8LUU6jfia6Wk9x
 6GqBeLj6nxFZK9OATiRGsrGf/ac9nqV5BbXVPMioMR+RmCTF/6/zeRVo+3M0Pn/+61g3jIf0sox
 zVDFfAbMFsYJ21n+jTooscIr3G13eoEyno2oV7HMRxrEFPZ+/+4mD8m+OH8O7USiVbDilFGU0JW
 TuOpIMQlWTUr8Ktax4Q==
X-Proofpoint-GUID: XXJqjGXv0bH41QN_HG2o1gB1xFjHEeCM
X-Proofpoint-ORIG-GUID: XXJqjGXv0bH41QN_HG2o1gB1xFjHEeCM
X-Authority-Analysis: v=2.4 cv=R6kz39RX c=1 sm=1 tr=0 ts=6a3e9ad9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wYGpMCW26V-xmeov4-8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyOCBTYWx0ZWRfX1xI1uT20OyQe
 pCJrmmy6HglJ+00kNMVmtT2kT1xd4I5sCNnkUUt0vAFPBJ8qDupbwFBU3rssS2isMk0hn74CbAi
 Bty/aMuh6HS+5U96Fuu0QNvVzYHVYIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260128

On 6/18/26 11:06 AM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages SPI frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate.
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
