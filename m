Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45C3B6371
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879503; cv=none; b=WBMj5aOFZLFP08UytBRYid2lFyZ2/VFWrWACWPG2RdcwfSKaNb5Nd8hQR5uV32wcyyft5+sXNKrjs7vqNKvL+bNiwh18C+698WFFOj3a0+SgivB7vNlcCziH2Wjg7TbP8PIUZftDGots8d2VJZvldYK/Dx9mSxGIg/UhFzgbynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879503; c=relaxed/simple;
	bh=qYRlSELHQp6zKyhMGtPerwaiMHkhrl2OunAlSvOpZeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMVYgVdVdt1oDg3y3M4A3gmGcoeXX+q+C/a4TmI6exHCBnF8EZD7eDeMuIjI7v5SrcydpRwN668F07EB86SHtqVna4FvY0Sx6E9Q4F9VxWNr1/RBDRLeMlZuaJFFKBuiQ8FgJpo7yoNs/i299XTV31/DFU4xDufLKz5W85PTisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGbGcpso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYjJYheF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGbGcpso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYjJYheF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lW3N2125257
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QiEpOMRDqoepNFTSolBo3Ao4N73q0PrjmLr8ahVBxbk=; b=fGbGcpso1rRwx1lQ
	pef4GE6JfSf98vdyWH1cEsVPRBK01yAYVYYL+weDBySQMUWX/TV6LNBo/JdaEG4/
	k563Sz7Mp+ocwIOwJS+mUsaz4Cmdzc98IZdLTpymc18/J7efVFftXXDPul8gMlXX
	rno8yTw9CQYLmJZp9ojMV8giUcPxVPRvA8KPlC00URXbj6bOk2d61hRqMvE3D7et
	S0gsaYgTy/3QtPRVox43LlIH0sq63HSJWrWtpMVuFy48BavGnSn1opumFoTC72b4
	2qoOvcbRIVGBJLeD6FekMjn1CG07ewqIPacACiGwJt/bcFb/njO6gtded8sQl3XY
	tiHYoA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamtnwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:51:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so2335585a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879501; x=1785484301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QiEpOMRDqoepNFTSolBo3Ao4N73q0PrjmLr8ahVBxbk=;
        b=EYjJYheFRGe31gPbjWBYQOcO3fQNN6vl1xAopRWvmOyO2gh0QwU+x6eY++9zU2DSZD
         /N540FFnqN/LnkCrI65kIkD1JLFsGeLJVWbg1V9ctH68l0mGoH4ccMH3KaN+BPjcAmhh
         bOne2qmOf+XlNUh7diJ8WlrsI0enIIK2D4OmaLBGcjDTO5KNkFBUJyWFhTjNly3MvRn5
         Box4soBSooZDPU4C5yk1ucLdYDNzYk5dcAhXhybxkrXJJUEFGdhFZueN/ARi8ebehCpY
         n4ZvPWqKxBHXiKoC2d60GhZkL6Vl0nWy9sbQHB8CFXLaMJnJSKOPNxYtO49Zdack1iVB
         LJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879501; x=1785484301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QiEpOMRDqoepNFTSolBo3Ao4N73q0PrjmLr8ahVBxbk=;
        b=UnK0bra/ohwfe4CZx0F7xUcvWMmzYt2T+ItoDS8t8Fu13uxXqLFaiyc31xTvosRvXe
         bKOJYuzuniWsP6l2XMYXCOHCDt/bdtN+qz9UrEnTrx15tev4lZvLRwB/jXVGqrYqOBtF
         AP/895+z8+HVx7+8VDXnMBB69FfbUDEZU3EvA8Ia2Jqs3QWAjtxaf8qIWsCY3Lu8NGQq
         CBSDYpSbETp1HrCA+RCAk/r5eOcQsupv1MHSyCX4I6CaKch65YjP7WqhJXr54xGvgJ/Q
         tyzsjj3S3Hl4WjgbXzFDnDwMZ1yUMtsTvc/9I9Q4pbLyq4tVo2MFwt1irD6JchYg6Seu
         /NmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq05aSe1qc+vWEdEULmSvHG5M0l0LwGneuPANy2MwU/Wy/OnCXBUjzMvadwonITu+pV2IQjUzlNtsSL@vger.kernel.org
X-Gm-Message-State: AOJu0YyLe3o+EdPAAbQQD/TkBtaXntDqmNp1/tFWFJtzXVkuEJNim5EC
	u3PIdTAnj4RZXjz/VxY5pujbdLjdVtomv3usWbwxVi/NgQLNi0cjxyQJh5H+6iQy4ViI1TK3cJR
	t3jkSfU69TJrAoDUUttHxcysxrn9NCdCenoi0y8pHarrlDAGDXp+Rp2nYEUlmgppKy2IoXpQX
X-Gm-Gg: AR+sD10T0Dx/0e9NTA7+1it8YKOZD1DdXcX6mE0Xc3qt0189VECPHMVT2d5Jvxf6oqz
	k6Ojyg2mGQUgcicyZ2ZEVbnUfEY71/+WM8sYYTNlxHSmqicfl6D/xmVIGs8Hetba+UpwyqfsTV+
	FJg2sGMjixMcJ7NnF5J2dDa8ew6Gn9dU7IGDzFjEe2AjjdP85iajC37xRxpt/0dj8XLSfTGPQpG
	TUcanS3DdHDivRs/6xs+rEZkGYaNApxZEgpPsE6E7g4gMZabGimE+uwaKLWPiLkkplVmbBoby9D
	vjo50ga6HQLCHOAC3NLwuzJ1sijfBRwYqvrzezb5YFXQlbauoYVl2ZkFbikA4CA9SfIDr7w1KHh
	e13XhsEkll6AbObPgSnVRKGRI
X-Received: by 2002:a05:622a:1c12:b0:517:8999:6c50 with SMTP id d75a77b69052e-5283df5e5cbmr44852021cf.8.1784879500863;
        Fri, 24 Jul 2026 00:51:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1c12:b0:517:8999:6c50 with SMTP id d75a77b69052e-5283df5e5cbmr44851821cf.8.1784879500414;
        Fri, 24 Jul 2026 00:51:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac700asm317467266b.15.2026.07.24.00.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:51:39 -0700 (PDT)
Message-ID: <27002c52-c569-48ba-8cd4-9f84a7fd7929@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:51:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Configure USB controllers
 are wakeup-capable
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
 <20260723-glymur-usb-fixes-v1-2-816357d5319c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-glymur-usb-fixes-v1-2-816357d5319c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MCBTYWx0ZWRfXykuF57YLk0++
 7hLkkLNum+VxzLj/Adq3F+ts64he6JPDALw+bh1+oS8U1AlrXuN0Mfh3UaG35zMFE4fO6c7ZqHc
 XQ68TRtfTeus+Z9mQFtbXYBTia+itiMw45CVf5XnS5+Vg08JU7GEDCEhpg0ABnOLFIwSAS+PW7B
 MAFckj0SswtWSAHMQ/gb4pGfpi0Ox03hsNaRNkcBnf9XM99Vo0l11qV5P+pjGFyVxGc8ZfPfi0v
 hn2QS7pVptcCpvQ9tXtOF1UPb8Z4xZCA/6+GUFYzwKLjaNtdFarVqjxVfVDxtTln6zPCxBr+/e7
 A5J2KGVkq1UMHU/gtSLZC5rf5Do8pEvbvK4qPH+QdYHbgAbXbhpHIkDY1iww8STeSu0YYjMagwh
 nSxe99R5BXbgrIYiekgKBVIIF9kx7YX3iMlYgcsdOhEuPhq5ql0lMqLJUgQJcuUpQZptifCIiNh
 mRAo/UUN3eTrNFyItkA==
X-Proofpoint-GUID: tC4GmujzoE-zC1Yzi63YMog6OTg0yzNX
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a63198d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i8nJ_-aNT86P3f_d1rcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MCBTYWx0ZWRfX/t6VrscSjqRV
 yntWj5DjlW8sFYBx1alncFqBmC0nLuoSgfS+3w752+eg4Ja0pHtjY9+FA/oIMU7BAEmw4g4zbsc
 RR2h7gZDn9zfBjSZhMI/CfpiS6UF/g8=
X-Proofpoint-ORIG-GUID: tC4GmujzoE-zC1Yzi63YMog6OTg0yzNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240070

On 7/23/26 7:32 PM, Krishna Kurapati wrote:
> All USB controller on Glymur are wakeup-capable device. Add wakeup-source
> property for each of them indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
