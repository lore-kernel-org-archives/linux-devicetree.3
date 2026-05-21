Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA24A381B06
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357517; cv=none; b=gfOVSH7Am4fcMuMjJZZvfXfT/493ZM5SG8rAGnog63yAC3qj9pYrbYl55zqbkvuJ+5paS+QNoDR0wqd7VkL5ZYwb0x31SnBFWMy+8Ef3sREjqpvxV795mbsoXQflK+dDSErJTBBqTqIeGVV/UIR4l0HIgbvmg6QssNWyBCfcnmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357517; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrTUV44bIZDnECQrPSIhjxkOAQ5HBcxMGGPCqRQv3Eufde/odicywAMK0NzAvxkZmH6qjWlRIj4RF1mOG6OniRIbr9aHYQZ1ZOT+ATa0buklf/72p5pbr6tni6H0VwUjYxI71x2R5yim3TboD7a0Fujtg4IgFKq5InmIVpqiwPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBL2RSuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrP7haKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBL2RSuO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrP7haKF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99qM73451507
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=ZBL2RSuOvK+d+ZMg
	i5d7/73CgeGqBo5uln9Q3Q27C4d8fS1kuLp3OAK8Qg/hsrug/LGRRaCsw4l/fJ/7
	Jbiq+ZJent8RKlFB+ygNkl5PxjiJkA9wXWq3tPa9G9Rvtrs+Cnk0tIZru611j7eW
	9UBU6HlgBxFUxpY7XnTTWLUQb5LE0VNYN1WzLHtEAZdX+eCrrt732RaTiximS3lR
	Ph+6FqVLG/NufVLk63i3a8KDnR04MZtDnqmM4V7rbQyukfOafoRgjrGfY6V7G1I5
	QeaZW++k47wkay4sYlgWxQ2Yh5qMbXUHo5gG02n5ECW2BPyCfLdRBhgCU8LY8odt
	JPtMBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h88a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so19017211cf.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357513; x=1779962313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=VrP7haKF5Zzfucs+tYdwQh95KMhcliPdsbupi09QnL3pGEO2Z7gIspv/9/fLa9MrHD
         jmFXRRgMIN5u9l0MYvnlKqjw+DDvGHprHEfWl8ipoHkISUJmAbuDIfKKu28altSc34vO
         kZBgJQGZK/79Z8g1AaFdfZ52fwrItholtArL9kIptrNGoIgOK7K0B7Gtw4FERAFuvWQL
         AVZFe3ckzm+kYPCXgGfn+lr8NtY2tNY3rvTT56mr1zhzU4u8gU6KBteEp77EC0koRs4K
         K+8R9TzicUGjyJRMSZrxiRFwXMcw4+S2i9jmoZPpLF9A3+13RS5U+4azrEHiRuk0oRIK
         l3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357513; x=1779962313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=bOSYTNNUyxlZh6ZWcWAqdpSoCuMex1KBXIKMDEe8cOGvULeydZRnVdGFIACxcxswLN
         RztbeMD8Q2GC8p+k143+EC47vEKWncw/Tx/uPdXCV97RrlTxMPZ/FcliCWquhDbKHpL5
         LntJ9MpH8pCqT/RofjR3dLgbQZOZx9RHyeHbLT+YVDzrgB4sGLqdBuO6pZeiWboZh5Im
         W7TRz+Kcl4ItUm1Wxjm/hZSr4WdFSn7DCEnxCOEo0LdIehEBRkmcQjYY6xbjB7nLoX0r
         aBDL3D7d8Hze1WnhyXJhMbWQ4BzHuKSC9NYxTfCpeXXXRohNg76iELNoK0AUookMvb9j
         v0Ww==
X-Forwarded-Encrypted: i=1; AFNElJ8fXmastFA9jcc2s6QCj3mH0D6w2v2LWcCBKS/CxxeT7Z5HYxVuJ8XnW3FSjIYfP88BeiePDEncKE1u@vger.kernel.org
X-Gm-Message-State: AOJu0YzUsh9hFg2RHVtsyjlFaWXvWKXYspKijZqyNrrvs8O8Y+qzwW7s
	luieKeqYSmZO3cDYdUlajoOUv2euhdlWfz9knAobruIYrwmkUFUQR7plo1ybYDKzIJmIGfHh2Mc
	0m5JH0DxI9FL2MmqnhvWJA/5xsOQl/IdQ/Nx7GEkuQZlEOER2v2kPZbegpB86veYV
X-Gm-Gg: Acq92OGWLjNb6kJFI0DHK6CORMyjEwVRfdB78Pe8p+YPmzF8stAy59sieR14LEjAs3I
	SvNenu6MCNzSZcoz/9U246nWnspGqxZ2vu83a/WcgKa9KeOZHciLIQA5LoZynOU5YHJC2vnV3el
	sEat19zZ1m3WotXNBw7RI4/s2t9RgcsqeaLlhCqYMypeFj+gdSrSpgzv9KNgaMU4ZpUlP50tqeM
	t7v44JOcN0snu6OCpva/UUYMTldVXZLKWIETIFGy7ykujcwc+K6wee+HmXcExK2a7JQ5z2gmCl+
	IQM5ak+2ZYV4kdXi/Z8f8BX44Eh7f5Cm8YpC8ecc80vyMMGog+KzOl7Pgt06kWlZLBQs5I99sIm
	T64Np0hzxV0DHPFVE5+Uw53wsi4VFMQywS8Rpwb8RK1ugkpcQ/z35Lhm0t0aNgiWHZv2B/snbeh
	LZ01o=
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18399121cf.3.1779357513471;
        Thu, 21 May 2026 02:58:33 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18398961cf.3.1779357513106;
        Thu, 21 May 2026 02:58:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc878912f4sm25602766b.5.2026.05.21.02.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:31 -0700 (PDT)
Message-ID: <d81e7cee-eb26-41e7-a1bd-09bb2691b1d6@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm8350: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-3-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-3-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OTshg47W42Vg7Ta-MENE0aA0Yt9z4UF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX8i3t5hdEyjze
 rynIz1NUkDIaZhSIKmZEvsW2ZuPDtO1HHn5QYFuoVy4IZkzLNccQi+/qQi5MGo4V/nU/226+xeI
 hUfnqeh8vSUADOhsSd7tOPuMwCRXIAk/zaTkXYaYTRa9CceFqGXm8hhXAJ4dflb9GsGb+Sh8AGt
 cB2ul4h7YJMCRYiMEYXkoN4wI8z00MHBB0UnOYGfNI4d9OYsZKZP/3mq4Vw3cpywcwsPCQ55f3s
 nrOGnzps4jQ40c4ba6zXefiTSWgZcV9S2Z3vBYJ3G2PwtQ7W3KR4/6UHF6lot6vrDUTL4Nbfp7u
 VRewjKQkdF2CewlOLqVExaF4sDgzUr0cidW7Q5IAG7EG+SXWB8Uzh2dKc4pp2syC/fcnF5APT/Q
 O/TJBf+c2OzF8FhIYS/hNFneX/z4vNCGUoo6pwuqBCxi2PIkQ3gTG1DpgXQjigQhzbeWPlStdkH
 8pH2LR4VfFgPd1/KPXQ==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0ed74a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: OTshg47W42Vg7Ta-MENE0aA0Yt9z4UF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
