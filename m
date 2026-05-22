Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2873A5E98
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456423; cv=none; b=EuXKZGhdUXKqV+SnAwKAN/+gV1+DrGneAOXyurSUkl994XUWtQqlh2TzeSR3f+oNl0RGvFT4k1jjT6xYkoXn0g9U6Zz2MC4vkZwvkoMk9On3bOY6ICMen2/SXgW48NYiqDcopCZZPhDlo5XHDzyBqlDzvl/V7uQ7lE0cXFch+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456423; c=relaxed/simple;
	bh=LmqK5rRmLSD7uS+kzV59AD9BkgWaK5uElWhr0Xw6qWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJx/YFlWT9gDmILW26Vjy7ia9p7Y6xXOnmD8cjZ/keOKqDnqnJS09zra5JZ5Ho/I+VsbtfDQrpmN4HLfrdLms2mopD3fLtOd/WIR9QmssN+PLAgK+YhOUiz7flO9UmM0uCEpEIvUpbG08Gm/M0CUMCaVsLjpRJnu2RQ72CRp1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRf48Q3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMFvWTni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRf48Q3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMFvWTni"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4KYB3947640
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=; b=QRf48Q3QxwtrM6kO
	A96X7cZMx2OOdjIMHEEMgzzfE5cT/fGVxYSmVDzcEy0WDzI6v6e5wEEOA2swkgs2
	lyL+WA+aq90Mo3+BIEt3WMlcbjWLCAnXFN41MzKmZbwgGSeONrzJrADDEpPiuI/A
	gXQgHJNjP+F7tLviU6cDBTBKJ75UJ5ZrKJf+xGxAUyQwGkynZsxoE9ByYVLG2+HL
	v8wzfobUxneJN3ZqzF/JMEu1O0xRjdG3km0zfOiaKLtVbYiOrSFW4lzGeiAUfwX6
	Uy4YyjC63Be+sQs8h8QTJCSNhIMRDROU0QKJB5nNPgc2z3wQfVcNppBDRJrkqeKl
	OwL8Qg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngnpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:27:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5d7f4b63so17463601cf.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779456420; x=1780061220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=;
        b=bMFvWTnik56f1dNOIq0NQZ6rU1dZQxr4GQ2Vh7L1A7Xupl+m2o7cotC3yPxmYyRJbc
         9rcAanqE6DP0oCrhtSFIWUDPUJiLAcCQq3hPGGtQSZQaogHtb0naCuPtTdomDz++3d+g
         lUpcfOaoqdnmcRqtMEeJECg9GzE60ub1fu4zW5S7Om4HvyNPoWi3ODoKkrKC3+D/slfX
         yG4ylJ8g5pBZNBO7UDNcQMKYPMl5p6y0G74QhOfW4uVU81Zq2NVF35Fwhh295g3iCGkI
         70bcihdQfdFQz5136+X9KJwEM0uY48eJI8BbF1Y+tNxeYTfh+QUHl36dSoBit6staHp6
         /yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456420; x=1780061220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=;
        b=W/AjFoS3r6YBj584vgQCw1Z3VfCjpFbLfw3vSDX4iOgwJ2RreTFtMA3mz1VW0RagKh
         umLXfLuYlEFIc2JO5qDgh4vy9HwoS5aQa9J0K77LMmD1pm6DFNBwB4+jhFCQSNvdfBWR
         BLheg6xex+nRv4O8ECN+Xrl6pMqnPLVyKkQgYGCjbbS6rDhycuKYKMtHk+lx6kVS4rRY
         zDbivX7hH4DY2R+uLIghJp/V8I1TfQqpwXBSku8JcQ5r91n25h5gLkCKmS+9bclm8n0O
         FSpX8o+dzgpVBfGJ1+S8LFexGak+58/z+e2N6ET7tc3BYIvwrvIGCjl4L4TcOFU2jOMV
         bvAg==
X-Forwarded-Encrypted: i=1; AFNElJ+3F/5C34dspQbZQGN6rgGb7M2Di9BimWrnAvM0NvpGiJD/C8G+QMB0rrCv7hJxp8Fn1X0JW3JYLgVD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8spEWpiewF7p513XY7kwlZo+OQIkXx3gH0uYj5h9Gy/zGt92U
	e4KsrVC/d1R6C5S0z/sHv7pwvJ9QP+CB750jIIa/Vt7Jt6CrCQ+CXQzeiOhMB4TDZeoSwPm4PVY
	30S3qv4wKEIl7uJAT3ulST5atGbsD8PFRZ9iQCa70nAG3rr1CezWSP+7M7SgWcu+k
X-Gm-Gg: Acq92OGZuThjkbsPFqacVF8vu5hW/gv72Gw5SRFE5bb5Ug0Uz3onso38F+kv/2tIMK7
	LeEIvHmkI1wcDbIfC3RcJ7AGZyhm8ehzp++U8hDg7/RS9cOUES9ThJkhJnJ1KYleqvEZSYTlGgD
	gWeFk9qTO5yYCTSrKb+U+E8oQsPJCmNfs4EVs5CpDqDNTIhXLG9PlvU5CIihf8BFBaM4Ko2q5Ii
	inFvPRlme2ALFPG2Mlq5iBKl95lxdoSQc93hkV+cLjbHUVDOxGiiqTaHMWvb5WFHad380cG9VOe
	B7KcvMbXWHVebZ6tSekJ5Ix0jdJPK8gGSNzKyaMNUuV31l+e/MbR6Owu9r/2WUjGlkOh3zg5RVn
	MhUfV3vM2AK6t7c8Yw8W0ZoGNDz7g7l34+OTENgdUBfn4UQ==
X-Received: by 2002:ac8:590e:0:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-516d4390a03mr35297491cf.5.1779456420098;
        Fri, 22 May 2026 06:27:00 -0700 (PDT)
X-Received: by 2002:ac8:590e:0:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-516d4390a03mr35297081cf.5.1779456419493;
        Fri, 22 May 2026 06:26:59 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3050fcfsm54570666b.20.2026.05.22.06.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:26:58 -0700 (PDT)
Message-ID: <366ec7d0-76e2-4658-919e-da650273e9a7@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:26:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1059a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wa8d-JAsDJw_VMoGAEIA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: xNihd9VDyvxqCM0anKS0D_Q-TijcHZxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNCBTYWx0ZWRfX0oT3i0DUYRx2
 gKhS2MqqLn4uJXu2pZYItzPuPHShjh3MB5qBSdOX5hRwkVkX7MokDHQ68ZHYivpu/2R1eCGnA6e
 um/faEIg85zQmjmx/7vpxlXJvEdJWnb0FdHhdFwoGKYKqS3w/PeXytkf4e+RWp+2xF7GAQiFNAK
 +k9wGAxU2VQ6NMY/W+PbusNjjo48trnU75fEElC4G3G4PTi+oSztbe/f8T2B7GVGJgTTzOqRLA/
 N0RBkQd/3V5ELctQosZDDmqKkwJJm18plsNhgqAfwGG5HqQTlr/6hxduA2V82LAJ4IJ+01b1eZZ
 rRJPcwgP/19KFfmPbWrtRB9JQHLpmBnqoLl4m9CViZcjOhpgyz3072g6X2S+A8JROJnItZDbmf4
 L21fIIA6UP+eFs4gDftwXPIniqAx3fSJpWU0eUrW5Z91wXH5acllzn0Je4CpCePHS7LW63Hx1Nk
 cTle4NEQmMovJSoBBFA==
X-Proofpoint-ORIG-GUID: xNihd9VDyvxqCM0anKS0D_Q-TijcHZxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220134

On 5/22/26 2:39 PM, Luca Weiss wrote:
> Add nodes for the two AW88261 amplifiers, for the top and bottom
> speakers of this phone. Hook them up to the sound card.
> 
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> RFC because the AW88261 patches aren't merged yet

Are you sure?

for the patch:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
